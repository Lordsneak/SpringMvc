package net.youcode.onlinereservation.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.youcode.onlinereservation.model.Calendrier;
import net.youcode.onlinereservation.model.User;
import net.youcode.onlinereservation.service.ReservationService;
import net.youcode.onlinereservation.service.UserService;



@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private ReservationService reservationService;

	private String isSignedUp = null;
	private String isLoggedIn = null;
	private User currentUser = null;
	private String isReservationMade = null;
	
	@GetMapping(value = "/")
	public String home(Model model) {
		List<Calendrier> dateList = reservationService.getAllDates();
		
		model.addAttribute("isSignedUp", isSignedUp);
		model.addAttribute("isLoggedIn", isLoggedIn);
		model.addAttribute("isReservationMade", isReservationMade);
		model.addAttribute("dateList", dateList);
		
		return "reservation";
	}
	@GetMapping(value = "/signin")
	public String loginpage(Model model) {
		
		model.addAttribute("isSignedUp", isSignedUp);
		model.addAttribute("isLoggedIn", isLoggedIn);
		
		return "login";
	}
	@GetMapping(value = "/signup")
	public String signuppage(Model model) {
	
		model.addAttribute("isSignedUp", isSignedUp);
		model.addAttribute("isLoggedIn", isLoggedIn);
		
		return "register";
	}
	@PostMapping(value = "/register")
	public String signup(User user) {
		System.out.println("User: " + user);
		int affectedRow = userService.saveUser(user);

		if (affectedRow > 0) {
			isSignedUp = "true";
		} else {
			isSignedUp = "false";
		}

		return "redirect:/";
	}
	
	@PostMapping(value = "/login")
	public String login(Model model, User user, HttpSession session) {
		
		User myuser = userService.login(user.getEmail(), user.getPassword());
		
		if (myuser != null) {
			isLoggedIn = "true";
			this.currentUser = myuser;
			
			if (this.currentUser.getRole().equals("admin")) {
				session.setAttribute("currentUser", this.currentUser);
				
				return "redirect:/admin";
			}
			
			
		} else {
			isLoggedIn = "false";
		}

		return "redirect:/";
	}
	
	@GetMapping(value = "/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		
		isSignedUp = null;
		isLoggedIn = null;
		isReservationMade = null;
		currentUser = null;
		
		
		return "redirect:/";
	}
	
	@PostMapping(value = "/reservation")
	public String makeCalendrier(Calendrier calendrier) {
		if (currentUser != null) {
			int affectedRow = userService.makeCalendrier(calendrier, currentUser.getId());
			
			if (affectedRow > 0) {
				isReservationMade = "true";
			} else {
				isReservationMade = "false";
			}
		}else {
			isReservationMade = "false";
		}
		return "redirect:/";
	}	
}
