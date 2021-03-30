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
	
	public static AdminDaoImpl serviceuser;

	@BeforeClass
	public static void init() throws Exception {
		User us = new User("Firstname H","Lastname L", "Email","@@11");

		ReservationDaoImpl rs = new ReservationDaoImpl();
		System.out.println("set Up Before Class");
	}

	@AfterClass
	public static void tearDownAfterClass() throws Exception {
		System.out.println("tear Down After Class");
	}
	
	
	@Before
	public void setUp() throws Exception {
		System.out.println("set Up");
		
		
	}

	@After
	public void tearDown() throws Exception {
		System.out.println("tear Down");
	}
	
	
	@Test
	public void TestMyName() {

		User ka = new User();
		ka.setFirstName("Hamza");
		assertEquals("Test",ka.getFirstName(), "Hamza");
	}

	@Test
	public void TestJdbc() throws ClassNotFoundException, SQLException{
		User name = new User();
		
		name.setFirstName("Hamza");
		
		AdminService u = new AdminServiceImpl();
		
			u.loadUsers();
			
			//System.out.println(ur);

	//	assertEquals("Test", name.getFirstName(), ur);	
		
	}
}
