<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="database.DbConnection" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%
  // Connect to the database and retrieve data for the first dropdown list
  String firstDropdownData = "";
  String secondDropdownData = "";
  String thirdDropdownData = "";
  String forthDropdownData = "";
  String fifthDropdownData = "";



    
    DbConnection db = new DbConnection();
	String query = "select * from speciality;";
	try {
		ResultSet rs = db.retrieve(query);
%>		

  <%   while (rs.next()) {
      firstDropdownData += "<option value='" + rs.getInt("speciality_Id") + "'>" + rs.getString("speciality_Type") + "</option>";
    }
    rs.close();
  } catch (Exception e) {
    // Handle errors
  }
%>



<script>
  function updateSecondDropdown() {
    // Get the selected value from the first dropdown list
    var firstDropdownValue = document.getElementById("firstDropdown").value;

    // Send an AJAX request to the server with the selected value
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        // Update the second dropdown list with the data received in the response
        document.getElementById("secondDropdown").innerHTML = this.responseText;
      }
    };
    xhttp.open("GET", "DoctorName.jsp?firstDropdownValue=" + firstDropdownValue, true);
    xhttp.send();
  }
</script>

<script>
  function updateThirdDropdown() {
    // Get the selected value from the first dropdown list
    var secondDropdownValue = document.getElementById("secondDropdown").value;

    // Send an AJAX request to the server with the selected value
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        // Update the second dropdown list with the data received in the response
        document.getElementById("thirdDropdown").innerHTML = this.responseText;
      }
    };
    xhttp.open("GET", "GetDate.jsp?secondDropdownValue=" + secondDropdownValue, true);
    xhttp.send();
  }
</script>

<script>
  function updateForthDropdown() {
    // Get the selected value from the first dropdown list
    var thirdDropdownValue = document.getElementById("thirdDropdown").value;

    // Send an AJAX request to the server with the selected value
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        // Update the second dropdown list with the data received in the response
        document.getElementById("forthDropdown").innerHTML = this.responseText;
      }
    };
    xhttp.open("GET", "STime.jsp?thirdDropdownValue=" + thirdDropdownValue, true);
    xhttp.send();
  }
</script>

<script>
  function updateFifthDropdown() {
    // Get the selected value from the first dropdown list
    var thirdDropdownValue = document.getElementById("thirdDropdown").value;

    // Send an AJAX request to the server with the selected value
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        // Update the second dropdown list with the data received in the response
        document.getElementById("fifthDropdown").innerHTML = this.responseText;
      }
    };
    xhttp.open("GET", "ETime.jsp?thirdDropdownValue=" + thirdDropdownValue, true);
    xhttp.send();
  }
</script>

<!-- First dropdown list -->
<select id="firstDropdown" onchange="updateSecondDropdown()">
<option value="" disabled selected>Speciality</option>
  <%= firstDropdownData %>
</select>

<!-- Second dropdown list -->
<select id="secondDropdown" onchange="updateThirdDropdown()">
  <option value="" disabled selected>Doctor</option>
<%= secondDropdownData %>
</select>
<!-- Third dropdown list -->
<select id="thirdDropdown" onchange="updateForthDropdown(),updateFifthDropdown()">
  <option value="" disabled selected>Date</option>
<%= thirdDropdownData %>
</select>

<!-- Fourth dropdown list -->
<select id="forthDropdown">
  <option value="" disabled selected>From</option>
<%= forthDropdownData %>
</select>

<!-- Third dropdown list -->
<select id="fifthDropdown">
  <option value="" disabled selected>To</option>
<%= fifthDropdownData %>
</select>

</body>
</html>