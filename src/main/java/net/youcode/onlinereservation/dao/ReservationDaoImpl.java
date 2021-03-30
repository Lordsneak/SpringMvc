package net.youcode.onlinereservation.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import net.youcode.onlinereservation.model.Calendrier;
import net.youcode.onlinereservation.rowmapper.CalendrierRowMapper;

@Repository
public class ReservationDaoImpl implements ReservationDao{
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	@Override
	public List<Calendrier> getAllDates() {
		String sql = "SELECT * FROM calendrier";
		List<Calendrier> datesList = jdbcTemplate.query(sql, new CalendrierRowMapper());
		return datesList;
	}

}
