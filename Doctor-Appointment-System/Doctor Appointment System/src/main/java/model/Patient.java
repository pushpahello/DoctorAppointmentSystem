package model;

public class Patient{
	   private int p_Id;
	    private String p_Fname;
	    private String p_Lname;
	    private char p_gender;
	    private String p_email;
	    private String p_age;
	    private String p_phoneNo;
	    private String p_address;
	    private String p_username;
	    private String p_password;

	    
	    public Patient(int p_Id, String p_Fname, String p_Lname, char p_gender, String p_email,String p_age, String p_phoneNo, String p_address, String p_username, String p_password) {
	    	this.p_Id=p_Id;
	    	this.p_Fname=p_Fname;
	    	this.p_Lname=p_Lname;
	    	this.p_gender=p_gender;
	    	this.p_email=p_email;
	    	this.p_age=p_age;
	    	this.p_phoneNo=p_phoneNo;
	    	this.p_address=p_address;
	    	this.p_username=p_username;
	    	this.p_password=p_password;
	    }
	    
	    public Patient( String p_Fname, String p_Lname,char p_gender, String p_email,String p_age, String p_phoneNo, String p_address, String p_username, String p_password) {
	    	this.p_Fname=p_Fname;
	    	this.p_Lname=p_Lname;
	    	this.p_gender=p_gender;
	    	this.p_email=p_email;
	    	this.p_age=p_age;
	    	this.p_phoneNo=p_phoneNo;
	    	this.p_address=p_address;
	    	this.p_username=p_username;
	    	this.p_password=p_password;
	    }
	    
	    public Patient(String p_username, String p_password) {
	    	this.p_username=p_username;
	    	this.p_password=p_password;
	    }
	    public Patient() {}
	    
	    /**
	     * @return int return the p_Id
	     */
	    public int getP_Id() {
	        return p_Id;
	    }

	    /**
	     * @param p_Id the p_Id to set
	     */
	    public void setP_Id(int p_Id) {
	        this.p_Id = p_Id;
	    }

	    /**
	     * @return String return the p_Fname
	     */
	    public String getP_Fname() {
	        return p_Fname;
	    }

	    /**
	     * @param p_Fname the p_Fname to set
	     */
	    public void setP_Fname(String p_Fname) {
	        this.p_Fname = p_Fname;
	    }

	    /**
	     * @return String return the p_Lname
	     */
	    public String getP_Lname() {
	        return p_Lname;
	    }

	    /**
	     * @param p_Lname the p_Lname to set
	     */
	    public void setP_Lname(String p_Lname) {
	        this.p_Lname = p_Lname;
	    }

	    /**
	     * @return String return the p_gender
	     */
	    public char getP_gender() {
	        return p_gender;
	    }

	    /**
	     * @param p_gender the p_gender to set
	     */
	    public void setP_gender(char p_gender) {
	        this.p_gender = p_gender;
	    }

	    /**
	     * @return String return the p_email
	     */
	    public String getP_email() {
	        return p_email;
	    }

	    /**
	     * @param p_email the p_email to set
	     */
	    public void setP_email(String p_email) {
	        this.p_email = p_email;
	    }

	    /**
	     * @return String return the p_age
	     */
	    public String getP_age() {
	        return p_age;
	    }

	    /**
	     * @param p_age the p_age to set
	     */
	    public void setP_age(String p_age) {
	        this.p_age = p_age;
	    }

	    /**
	     * @return String return the p_phoneNo
	     */
	    public String getP_phoneNo() {
	        return p_phoneNo;
	    }

	    /**
	     * @param p_phoneNo the p_phoneNo to set
	     */
	    public void setP_phoneNo(String p_phoneNo) {
	        this.p_phoneNo = p_phoneNo;
	    }

	    /**
	     * @return String return the p_address
	     */
	    public String getP_address() {
	        return p_address;
	    }

	    /**
	     * @param p_address the p_address to set
	     */
	    public void setP_address(String p_address) {
	        this.p_address = p_address;
	    }

	    /**
	     * @return String return the p_username
	     */
	    public String getP_username() {
	        return p_username;
	    }

	    /**
	     * @param p_username the p_username to set
	     */
	    public void setP_username(String p_username) {
	        this.p_username = p_username;
	    }

	    /**
	     * @return String return the p_password
	     */
	    public String getP_password() {
	        return p_password;
	    }

	    /**
	     * @param p_password the p_password to set
	     */
	    public void setP_password(String p_password) {
	        this.p_password = p_password;
	    }	}
