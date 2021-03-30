package net.youcode.onlinereservation.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import net.youcode.onlinereservation.model.Calendrier;


public class CalendrierRowMapper implements RowMapper<Calendrier> {

	@Override
	public Calendrier mapRow(ResultSet rs, int rowNum) throws SQLException {
		Calendrier cal = new Calendrier(rs.getInt("id"), rs.getString("reservation_date"), rs.getString("reservation_time"),
				rs.getInt("seats_number"));

		return cal;
	}

}
