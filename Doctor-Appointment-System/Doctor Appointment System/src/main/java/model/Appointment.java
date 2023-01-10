package model;

import java.sql.Date;
import java.sql.Time;

public class Appointment {
	
	private int app_Id;
	private int p_Id;
	private int d_Id;
	private Date app_date;
	private  Time app_time;
	
	
	public Appointment(int app_Id, int p_Id, int d_Id, Date app_date,  Time app_time) {
		this.app_Id=app_Id;
		this.p_Id=p_Id;
		this.d_Id=d_Id;
		this.app_date=app_date;
		this.app_time=app_time;
	}
	
	public Appointment(int p_Id, int d_Id, Date app_date,  Time app_time) {
		this.p_Id=p_Id;
		this.d_Id=d_Id;
		this.app_date=app_date;
		this.app_time=app_time;
	}
	
	public Appointment() {}
	
	public int getApp_Id() {
		return app_Id;
	}
	public void setApp_Id(int app_Id) {
		this.app_Id = app_Id;
	}
	public int getP_Id() {
		return p_Id;
	}
	public void setP_Id(int p_Id) {
		this.p_Id = p_Id;
	}
	public int getD_Id() {
		return d_Id;
	}
	public void setD_Id(int d_Id) {
		this.d_Id = d_Id;
	}
	public Date getApp_date() {
		return app_date;
	}
	public void setApp_date(Date app_date) {
		this.app_date = app_date;
	}
	public Time getApp_time() {
		return app_time;
	}
	public void setApp_time(Time app_time) {
		this.app_time = app_time;
	}
}
