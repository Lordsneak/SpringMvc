package net.youcode.onlinereservation.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.youcode.onlinereservation.dao.ReservationDao;
import net.youcode.onlinereservation.model.Calendrier;

@Service
public class ReservationServiceImpl implements ReservationService{

	@Autowired
	private ReservationDao reservationDao;
	
	@Override
	public List<Calendrier> getAllDates() {
		List<Calendrier> datesList = reservationDao.getAllDates();
		
		return datesList;
	}

}
