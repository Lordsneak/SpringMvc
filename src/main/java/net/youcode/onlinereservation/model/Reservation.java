package net.youcode.onlinereservation.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "reservations")
public class Reservation {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	
	private Integer id;
	
	@Column(name = "reservation_date")
	private String reservationDate;

	@Column(name = "reservation_time")
	private String reservationTime;

	@Column(name = "seats_number")
	private String seatsNumber;

	@Column(name = "isTaken")
	private boolean isTaken;

	@Column(name = "isAccepted")
	private boolean isAccepted;
	
	@ManyToOne
	private User user;
	
	
	public Reservation() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReservationDate() {
		return reservationDate;
	}

	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
	}

	public String getReservationTime() {
		return reservationTime;
	}

	public void setReservationTime(String reservationTime) {
		this.reservationTime = reservationTime;
	}

	public String getSeatsNumber() {
		return seatsNumber;
	}

	public void setSeatsNumber(String seatsNumber) {
		this.seatsNumber = seatsNumber;
	}

	public boolean isTaken() {
		return isTaken;
	}

	public void setTaken(boolean isTaken) {
		this.isTaken = isTaken;
	}

	public boolean isAccepted() {
		return isAccepted;
	}

	public void setAccepted(boolean isAccepted) {
		this.isAccepted = isAccepted;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Reservation(Integer id, String reservationDate, String reservationTime, String seatsNumber, boolean isTaken,
			boolean isAccepted, User user) {
		super();
		this.id = id;
		this.reservationDate = reservationDate;
		this.reservationTime = reservationTime;
		this.seatsNumber = seatsNumber;
		this.isTaken = isTaken;
		this.isAccepted = isAccepted;
		this.user = user;
	}

	@Override
	public String toString() {
		return "Reservation [id=" + id + ", reservationDate=" + reservationDate + ", reservationTime=" + reservationTime
				+ ", seatsNumber=" + seatsNumber + ", isTaken=" + isTaken + ", isAccepted=" + isAccepted + ", user="
				+ user + "]";
	}


	
	
	
	
}
