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
  // Get the selected value from the first dropdown list
  String firstDropdownValue = request.getParameter("firstDropdownValue");

  // Connect to the database and retrieve data for the second dropdown list
  String secondDropdownData = "";
  try {
    // Replace with your own database connection details
    
    DbConnection db = new DbConnection();
	String query = "SELECT * FROM doctor WHERE speciality_Id = " + firstDropdownValue;
		ResultSet rs = db.retrieve(query);
    while (rs.next()) {
      secondDropdownData += "<option value='" + rs.getInt("d_Id") + "'>" + rs.getString("d_Fname") + " " + rs.getString("d_Lname") + "</option>";
    }
    rs.close();
  } catch (Exception e) {
    // Handle errors
  }
%>

<!-- Return the data for the second dropdown list as the response -->
<%= secondDropdownData %>



</body>
</html>