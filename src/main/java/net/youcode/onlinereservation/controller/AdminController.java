package net.youcode.onlinereservation.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import net.youcode.onlinereservation.model.Calendrier;
import net.youcode.onlinereservation.model.Reservation;
import net.youcode.onlinereservation.model.User;
import net.youcode.onlinereservation.service.AdminService;

@Controller
public class AdminController {

	private String isReservationCreated = null;
	
	@Autowired
	private AdminService adminService;
	
	@GetMapping(value = "/admin")
	public String admin(Model model, HttpSession session) {
		List<User> usersList = adminService.loadUsers();
		List<Reservation> reservationsList = adminService.loadReservations();

		model.addAttribute("users", usersList);
		model.addAttribute("reservationsList", reservationsList);
		model.addAttribute("isAppointmentCreated", isReservationCreated);
		
		User user = (User) session.getAttribute("currentUser");
		
		if (user != null) {

			return "admin";	
		} else {
			return "redirect:/";	
		}
	}
	//
	@PostMapping(value = "/accept")
	public String accept(User user) {

		adminService.acceptUser(user.getId().toString(), user.getEmail());
		
		return "redirect:/admin";
	}
	//
	@PostMapping(value = "/reject")
	public String reject(User user) {
		
		adminService.rejectUser(user.getId().toString(), user.getEmail());

		return "redirect:/admin";
	}
	
	@PostMapping(value = "/acceptReservation")
	public String acceptReservation(Reservation reservation) {
	
		adminService.acceptReservation(reservation.getId(), reservation.getUser().getEmail());
		
		return "redirect:/admin";
	}
	
	@PostMapping(value = "/rejectReservation")
	public String rejectReservation(Reservation reservation) {
	
		adminService.rejectReservation(reservation.getId(), reservation.getUser().getEmail());
		
		return "redirect:/admin";
	}
	
	@PostMapping(value = "/createDate")
	public String createDate(Calendrier calendrier) {

		
		int affectedRow = adminService.createReservation(calendrier);
		
		if (affectedRow > 0) {
			isReservationCreated = "true";
		}else {
			isReservationCreated = "false";
		}
		
		return "redirect:/admin";
	}
	
}
