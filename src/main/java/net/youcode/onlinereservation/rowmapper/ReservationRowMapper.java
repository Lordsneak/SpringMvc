package net.youcode.onlinereservation.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import net.youcode.onlinereservation.model.Reservation;
import net.youcode.onlinereservation.model.User;


public class ReservationRowMapper implements RowMapper<Reservation> {
	

	@Override
	public Reservation mapRow(ResultSet rs, int rowNum) throws SQLException {
		User user = new User();
		user.setFirstName(rs.getString("firstname"));
		user.setLastName(rs.getString("lastname"));
		user.setEmail(rs.getString("email"));
		
		Reservation rese = new Reservation(
				rs.getInt("id"), 
				rs.getString("reservation_date"),
				rs.getString("reservation_time"), 
				rs.getString("seats_number"), 
				rs.getBoolean("isTaken"),
				rs.getBoolean("isAccepted"), user);
		
		System.out.println(rese.getUser());
		return rese;
	}

}
