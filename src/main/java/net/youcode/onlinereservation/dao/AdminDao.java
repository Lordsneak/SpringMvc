package net.youcode.onlinereservation.dao;

import java.util.List;

import net.youcode.onlinereservation.model.Calendrier;
import net.youcode.onlinereservation.model.Reservation;
import net.youcode.onlinereservation.model.User;

public interface AdminDao {
	List<User> loadUsers();

	int acceptUser(String id);

	int rejectUser(String id);

	List<Reservation> loadReservations();

	int acceptReservation(Integer id);

	int rejectReservation(Integer id);

	int createReservation(Calendrier calendrier);
}	
