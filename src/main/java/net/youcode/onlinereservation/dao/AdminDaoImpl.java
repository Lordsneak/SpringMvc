package net.youcode.onlinereservation.dao;

import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.youcode.onlinereservation.model.Calendrier;
import net.youcode.onlinereservation.model.Reservation;
import net.youcode.onlinereservation.model.User;


@Repository
public class AdminDaoImpl implements AdminDao{
	@Autowired
	private SessionFactory sessionFactory;

	private Session session = null;
	

	@SuppressWarnings("unchecked")
	@Override
	public List<User> loadUsers() {
		
		session = sessionFactory.openSession();

		session.beginTransaction();

		String hql = "From User WHERE active = 1";

		List<User> usersList = session.createQuery(hql).getResultList();

		session.close();

		return usersList;

	}


	@Override
	public int acceptUser(String id) {

		String hqlUpdate = "UPDATE User SET active = 0 WHERE id = :id";

		session = sessionFactory.openSession();
		session.beginTransaction();

		Query query = session.createQuery(hqlUpdate);
		query.setParameter("id", Integer.parseInt(id));

		int affectedRows = query.executeUpdate();
		session.getTransaction().commit();

		return affectedRows;
		
	}

	@Override
	public int rejectUser(String id) {
		
		String hqlDelete = "DELETE FROM User WHERE id = :id";

		session = sessionFactory.openSession();
		session.beginTransaction();

		
		Query query = session.createQuery(hqlDelete);
		query.setParameter("id", Integer.parseInt(id));

		int affectedRows = query.executeUpdate();
		session.getTransaction().commit();

		return affectedRows;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Reservation> loadReservations() {
		
		String hql = "FROM Reservation AS a WHERE a.isAccepted != 1";

		session = sessionFactory.openSession();

		session.beginTransaction();

		List<Reservation> reservations = session.createQuery(hql).getResultList();

		session.close();
		
		return reservations;

	}

	@Override
	public int acceptReservation(Integer id) {

		String updateQuery = "UPDATE Reservation SET isAccepted = 1 WHERE id = :id";

		session = sessionFactory.openSession();
		session.beginTransaction();

		Query query = session.createQuery(updateQuery);
		query.setParameter("id", id);

		int affectedRows = query.executeUpdate();
		session.getTransaction().commit();

		return affectedRows;
	}

	@Override
	public int rejectReservation(Integer id) {
		
		String deleteQuery = "DELETE FROM Reservation WHERE id = :id";

		session = sessionFactory.openSession();
		session.beginTransaction();

		Query query = session.createQuery(deleteQuery);
		query.setParameter("id", id);

		int affectedRows = query.executeUpdate();
		session.getTransaction().commit();

		return affectedRows;
	}

	@Override
	public int createReservation(Calendrier calendrier) {

		String reservationDate = calendrier.getReservationDate();
		String reservationTime = calendrier.getReservationTime();
		Integer seatsNumber = calendrier.getSeatsNumber();

		Calendrier d = new Calendrier(reservationDate, reservationTime, seatsNumber);

		session = sessionFactory.openSession();
		session.beginTransaction();

		int affectedRows = (int) session.save(d);

		session.getTransaction().commit();

		return affectedRows;
	}

}
