package net.youcode.onlinereservation.dao;

import java.util.List;

import net.youcode.onlinereservation.model.Calendrier;

public interface ReservationDao {
	List<Calendrier> getAllDates();
}
