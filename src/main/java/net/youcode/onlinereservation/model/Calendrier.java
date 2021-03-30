package net.youcode.onlinereservation.model;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Calendrier")
public class Calendrier {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "reservation_date")
	private String reservationDate;

	@Column(name = "reservation_time")
	private String reservationTime;

	@Column(name = "seats_number")
	private Integer seatsNumber;

	public Integer getId() {
		return id;
	}
	
	
	public Calendrier(String reservationDate, String reservationTime, Integer seatsNumber) {
		super();
		this.reservationDate = reservationDate;
		this.reservationTime = reservationTime;
		this.seatsNumber = seatsNumber;
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

	public Integer getSeatsNumber() {
		return seatsNumber;
	}

	public void setSeatsNumber(Integer seatsNumber) {
		this.seatsNumber = seatsNumber;
	}


	public Calendrier(Integer id, String reservationDate, String reservationTime, Integer seatsNumber) {
		super();
		this.id = id;
		this.reservationDate = reservationDate;
		this.reservationTime = reservationTime;
		this.seatsNumber = seatsNumber;
	}

	public Calendrier() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Calendrier [id=" + id + ", reservationDate=" + reservationDate + ", reservationTime=" + reservationTime
				+ ", seatsNumber=" + seatsNumber + "]";
	}
	
	
	
	
	
	
}
