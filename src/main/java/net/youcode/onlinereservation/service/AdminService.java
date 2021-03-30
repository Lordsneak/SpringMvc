package net.youcode.onlinereservation.service;

import java.util.List;

import net.youcode.onlinereservation.model.Calendrier;
import net.youcode.onlinereservation.model.Reservation;
import net.youcode.onlinereservation.model.User;

public interface AdminService {
	List<User> loadUsers();

	void acceptUser(String id, String email);

	void rejectUser(String id, String email);
	
	List<Reservation> loadReservations();

	void acceptReservation(Integer id, String email);

	void rejectReservation(Integer id, String email);

	int createReservation(Calendrier calendrier);
}
