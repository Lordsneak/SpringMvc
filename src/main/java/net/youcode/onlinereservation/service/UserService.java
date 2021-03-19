package net.youcode.onlinereservation.service;

import net.youcode.onlinereservation.model.Calendrier;
import net.youcode.onlinereservation.model.User;

public interface UserService {
	
	int saveUser(User user);

	User login(String email, String password);
	
	int makeCalendrier(Calendrier calendrier, int id);
	
	boolean validateSignup(User user);
	
	boolean validateAppointment(Calendrier calendrier);
	
	boolean validateLogin(String email, String password);
	
}