<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
        <%@ page import="database.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
  // Get the selected value from the second dropdown list
  String thirdDropdownValue = request.getParameter("thirdDropdownValue");

  // Connect to the database and retrieve data for the fifth dropdown list
  String fifthDropdownData = "";
  try {
    
    DbConnection db = new DbConnection();

    Date date=Date.valueOf(thirdDropdownValue);

	String query = "SELECT * FROM Availability WHERE available_date=?";
	PreparedStatement st = db.con.prepareStatement(query);
	st.setDate(1, date); 
		ResultSet rs = db.retrieve(st);
    while (rs.next()) {
    	String time=rs.getTime("end_time").toString();
      fifthDropdownData += "<option value='" + time + "'>" + time + "</option>";
    }
    rs.close();
  } catch (Exception e) {
    // Handle errors
  }
%>

<!-- Return the data for the forth dropdown list as the response -->
<%= fifthDropdownData %>
</body>
</html>