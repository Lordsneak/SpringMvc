package net.youcode.onlinereservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.youcode.onlinereservation.dao.AdminDao;
import net.youcode.onlinereservation.model.Calendrier;
import net.youcode.onlinereservation.model.Reservation;
import net.youcode.onlinereservation.model.User;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public List<User> loadUsers() {
		
		List<User> usersList = adminDao.loadUsers();
		
		return usersList;
	}

	@Override
	public void acceptUser(String id, String email) {
		
		adminDao.acceptUser(id);
		
	}

	@Override
	public void rejectUser(String id, String email) {
		
		adminDao.rejectUser(id);
		
	}

	@Override
	public List<Reservation> loadReservations() {
		List<Reservation> reservationsList = adminDao.loadReservations();
		return reservationsList;
	}

	@Override
	public void acceptReservation(Integer id, String email) {
		adminDao.acceptReservation(id);
		
		
	}

	@Override
	public void rejectReservation(Integer id, String email) {
		adminDao.rejectReservation(id);
		
	}

	@Override
	public int createReservation(Calendrier calendrier) {
		int affectedRow = adminDao.createReservation(calendrier);
		return affectedRow;
	}

}
