package net.youcode.onlinereservation.dao;

import net.youcode.onlinereservation.model.Calendrier;
import net.youcode.onlinereservation.model.User;

public interface UserDao {
	
	int saveUser(User user);

	User login(String email, String password);

	int makeCalendrier(String reservationDate, String reservationTime, String seatsNumber, int id);
}