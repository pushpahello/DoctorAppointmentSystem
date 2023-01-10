package model;

public class Doctor {
	private int d_Id;
	private int speciality_Id;
    private String d_Fname;
    private String d_Lname;
    private String d_email;
    private String d_phoneNo;
    private String d_address;
    private String d_username;
    private String d_password;

    public Doctor(int d_Id, int speciality_Id, String d_Fname, String d_Lname, String d_email, String d_phoneNo, 
    		String d_address, String d_username, String d_password)    {
    	this.d_Id=d_Id;
    	this.speciality_Id=speciality_Id;
    	this.d_Fname=d_Fname;
    	this.d_Lname=d_Lname;
    	this.d_email=d_email;
    	this.d_phoneNo=d_phoneNo;
    	this.d_address=d_address;
    	this.d_username=d_username;
    	this.d_password=d_password;
    }
    
    public Doctor( int speciality_Id, String d_Fname, String d_Lname, String d_email, String d_phoneNo, 
    		String d_address, String d_username, String d_password)    {
    	this.speciality_Id=speciality_Id;
    	this.d_Fname=d_Fname;
    	this.d_Lname=d_Lname;
    	this.d_email=d_email;
    	this.d_phoneNo=d_phoneNo;
    	this.d_address=d_address;
    	this.d_username=d_username;
    	this.d_password=d_password;
    }
    
    public Doctor() {}
    
    public int getD_Id() {
		return d_Id;
	}
	public void setD_Id(int d_Id) {
		this.d_Id = d_Id;
	}
	public int getSpeciality_Id() {
		return speciality_Id;
	}
	public void setSpeciality_Id(int speciality_Id) {
		this.speciality_Id = speciality_Id;
	}
	public String getD_Fname() {
		return d_Fname;
	}
	public void setD_Fname(String d_Fname) {
		this.d_Fname = d_Fname;
	}
	public String getD_Lname() {
		return d_Lname;
	}
	public void setD_Lname(String d_Lname) {
		this.d_Lname = d_Lname;
	}
	public String getD_email() {
		return d_email;
	}
	public void setD_email(String d_email) {
		this.d_email = d_email;
	}
	public String getD_phoneNo() {
		return d_phoneNo;
	}
	public void setD_phoneNo(String d_phoneNo) {
		this.d_phoneNo = d_phoneNo;
	}
	public String getD_address() {
		return d_address;
	}
	public void setD_address(String d_address) {
		this.d_address = d_address;
	}
	public String getD_username() {
		return d_username;
	}
	public void setD_username(String d_username) {
		this.d_username = d_username;
	}
	public String getD_password() {
		return d_password;
	}
	public void setD_password(String d_password) {
		this.d_password = d_password;
	}
}
