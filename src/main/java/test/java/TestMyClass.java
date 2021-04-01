package test.java;

import static org.junit.Assert.assertEquals;
import static org.junit.jupiter.api.Assertions.*;

import java.sql.SQLException;
import java.util.List;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import net.youcode.onlinereservation.dao.AdminDao;
import net.youcode.onlinereservation.dao.AdminDaoImpl;
import net.youcode.onlinereservation.dao.ReservationDao;
import net.youcode.onlinereservation.dao.ReservationDaoImpl;
import net.youcode.onlinereservation.dao.UserDAOImpl;
import net.youcode.onlinereservation.dao.UserDao;
import net.youcode.onlinereservation.model.Calendrier;
import net.youcode.onlinereservation.model.Reservation;
import net.youcode.onlinereservation.model.User;
import net.youcode.onlinereservation.service.AdminService;
import net.youcode.onlinereservation.service.AdminServiceImpl;
import net.youcode.onlinereservation.service.UserService;

class TestMyClass {
	@Autowired
	private UserService userService;


	@Test
	public void testMyName() {

		User ka = new User();
		ka.setFirstName("Hamza");
		assertEquals("Test",ka.getFirstName(), "Hamza");
	}


	@Test
	public void testMyLogin() {
		String email = "Hamza@gmail.com";
		String password = "123456";
		
		User user = new User();
		user.setEmail("Hamza@gmail.com");
		user.setPassword("123456");
		
		User testlogin = userService.login(email, password);
		
		assertEquals(user, testlogin);
	}
}
