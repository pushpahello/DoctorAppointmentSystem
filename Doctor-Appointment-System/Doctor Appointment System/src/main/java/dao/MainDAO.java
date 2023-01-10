package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;

import database.DbConnection;
import model.Appointment;
import model.Doctor;
import model.Patient;

public class MainDAO {
	DbConnection db = new DbConnection();
	
	
	public int registerpatientPrepaedStatement (Patient patient) { 
		try {String query = "insert into Patient (p_Fname, p_Lname, p_gender, p_email,p_age," + "p_phoneNo,p_address, p_username, p_password) values (?,?,?, ?, ?, ?, ?,?,?)";
		PreparedStatement st = db.con.prepareStatement (query);
		st.setString(1, patient.getP_Fname()); 
		st.setString(2, patient.getP_Lname());
		st.setString(3, String.valueOf(patient.getP_gender()));
		st.setString(4, patient.getP_email());
		st.setString(5, String.valueOf(patient.getP_age()));
		st.setString(6, patient.getP_phoneNo()); 
		st.setString(7, patient.getP_address());
		st.setString(8, patient.getP_username());
		st.setString(9, patient.getP_password());
		return db.manipulate(st);
		} catch (SQLException e) { e.printStackTrace(); return 0;
		}
		}
	
//	public int addDoctorPreparedStatement (Doctor doctor) { 
//		try {String query = "insert into Doctor (speciality_Id, d_Fname, d_Lname, d_email," + "String d_phoneNo, \r\n"
//				+ "    		String d_address, String d_username, String d_password) values (?,?,?, ?, ?, ?, ?,?,?)";
//		PreparedStatement st = db.con.prepareStatement (query);
//		st.setString(1, patient.getP_Fname()); 
//		st.setString(2, patient.getP_Lname());
//		st.setString(3, String.valueOf(patient.getP_gender()));
//		st.setString(4, patient.getP_email());
//		st.setString(5, String.valueOf(patient.getP_age()));
//		st.setString(6, patient.getP_phoneNo()); 
//		st.setString(7, patient.getP_address());
//		st.setString(8, patient.getP_username());
//		st.setString(9, patient.getP_password());
//		return db.manipulate(st);
//		} catch (SQLException e) { e.printStackTrace(); return 0;
//		}
//		}
	
	public int appointmentPrepaedStatement (Appointment appointment) { 
		try {String query = "insert into Appointment (p_Id,  d_Id, app_date, app_time) values (?,?,?,?)";
		PreparedStatement st = db.con.prepareStatement (query);
		st.setInt(1, appointment.getP_Id()); 
		st.setInt(2, appointment.getD_Id());
		st.setDate(3, appointment.getApp_date());
		st.setTime(4, appointment.getApp_time());
		
		return db.manipulate(st);
		} catch (SQLException e) { e.printStackTrace(); return 0;
		}
		}
}
