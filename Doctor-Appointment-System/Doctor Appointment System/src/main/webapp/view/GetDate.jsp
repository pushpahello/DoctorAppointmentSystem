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
  String secondDropdownValue = request.getParameter("secondDropdownValue");

  // Connect to the database and retrieve data for the third dropdown list
  String thirdDropdownData = "";
  try {
    // Replace with your own database connection details
    
    DbConnection db = new DbConnection();
	String query = "SELECT * FROM Availability WHERE d_Id = " + secondDropdownValue;
		ResultSet rs = db.retrieve(query);
    while (rs.next()) {
    	String date=rs.getDate("available_date").toString();
      thirdDropdownData += "<option value='" + date + "'>" + date + "</option>";
    }
    rs.close();
  } catch (Exception e) {
    // Handle errors
  }
%>

<!-- Return the data for the third dropdown list as the response -->
<%= thirdDropdownData %>





</body>
</html>