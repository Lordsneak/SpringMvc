package net.youcode.onlinereservation.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.youcode.onlinereservation.dao.UserDao;
import net.youcode.onlinereservation.model.Calendrier;
import net.youcode.onlinereservation.model.User;


@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserDao userDAO;

	@Override
	public int saveUser(User user) {
		if (this.validateSignup(user)) {
			int affectedRow = userDAO.saveUser(user);
			return affectedRow;
		} else {
			return 0;
		}
	}

	@Override
	public User login(String email, String password) {
		if (validateLogin(email, password)) {
			return userDAO.login(email, password);
		} else {
			return null;
		}
	}

	@Override
	public int makeCalendrier(Calendrier calendrier, int id) {
		
		String reservationDate;
		String reservationTime;
		String seatsNumber;
		
		try {
			if (this.validateAppointment(calendrier)) {
				reservationDate = calendrier.getReservationDate() ;

				reservationTime = calendrier.getReservationTime();
				seatsNumber = calendrier.getSeatsNumber().toString();
				
				int affectedRow = userDAO.makeCalendrier(reservationDate, reservationTime, seatsNumber, id);
				return affectedRow;
			} else {
				return 0;
			}
		}catch(NullPointerException nl) {
			return 0;
		}
		
	}

	@Override
	public boolean validateSignup(User user) {
		if (!(user.getFirstName().isBlank() && user.getLastName().isBlank() && user.getEmail().isBlank()
				&& user.getPassword().isBlank())) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean validateAppointment(Calendrier calendrier) {
		if (calendrier.getReservationDate() != null && calendrier.getReservationTime() != null && calendrier.getSeatsNumber() != null) {
			if (!(calendrier.getReservationDate().isBlank() && calendrier.getReservationTime().isBlank()
					&& calendrier.getSeatsNumber() != 0)) {
				return true;
			} else {
				return false;
			}
		} else {
			return false;
		}
	}

	@Override
	public boolean validateLogin(String email, String password) {
		if (email != null && password != null && !(email.isBlank() && password.isBlank())) 
			return true;
		return false;
	}

}
