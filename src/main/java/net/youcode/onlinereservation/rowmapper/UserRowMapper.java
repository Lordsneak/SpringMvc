package net.youcode.onlinereservation.rowmapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;


import net.youcode.onlinereservation.model.User;


public class UserRowMapper implements RowMapper<User> {

	@Override
	public User mapRow(ResultSet rs, int rowNum) throws SQLException {

		User user = new User(rs.getInt("id"),
				rs.getString("firstname"),
				rs.getString("lastname"),
				rs.getString("email"),
				rs.getString("password"),
				rs.getString("role"),
				rs.getBoolean("active"));

		return user;
	}

}
