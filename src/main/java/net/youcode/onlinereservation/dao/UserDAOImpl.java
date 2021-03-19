package net.youcode.onlinereservation.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import net.youcode.onlinereservation.model.Calendrier;
import net.youcode.onlinereservation.model.Reservation;
import net.youcode.onlinereservation.model.User;
import net.youcode.onlinereservation.rowmapper.UserRowMapper;

@Repository
public class UserDAOImpl implements UserDao{
	@Autowired
	private SessionFactory sessionFactory;

	private Session session = null;
	
	@Override
	public int saveUser(User user) {

		String firstName = user.getFirstName();
		String lastName = user.getLastName();
		String email = user.getEmail();
		String password = user.getPassword();

		User u = new User(firstName, lastName, email, password);
		u.setActive(true);
		u.setRole("user");

		session = sessionFactory.openSession();
		session.beginTransaction();

		int affectedRows = (int) session.save(u);

		session.getTransaction().commit();

		return affectedRows;	
		
	}

	@Override
	public User login(String email, String password) {
		
		session = sessionFactory.openSession();

		session.beginTransaction();

		String hql = "From User WHERE email = :email AND password = :password AND active = 0";

		User user = (User) session.createQuery(hql).setParameter("email", email).setParameter("password", password)
				.uniqueResult();

		if (user != null) {
			return user;
		} else {

			return null;
		}
		
	}

	@Override
	public int makeCalendrier(String reservationDate, String reservationTime, String seatsNumber, int id) {
		User u = new User();
		u.setId(id);

		Reservation a = new Reservation();
		a.setReservationDate(reservationDate);
		a.setReservationTime(reservationTime);
		a.setSeatsNumber(seatsNumber);
		a.setUser(u);
		a.setAccepted(true);
		a.setTaken(true);

		session = sessionFactory.openSession();
		session.beginTransaction();

		int affectedRows = (int) session.save(a);

		session.getTransaction().commit();

		return affectedRows;
	}

}
