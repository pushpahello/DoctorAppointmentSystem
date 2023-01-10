<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.Calendar" %>
         <%@ page import="database.DbConnection" %>
    <%@ page import="java.sql.*" %>
        <%@ page import="java.util.*" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Patient Dash</title>
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Calendar</title>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,600,700" rel="stylesheet">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
</head>
<style>
<%@
include file="/CSS/patientDash.css"%>
</style> 

<body>
<!--<form action="<%= request.getContextPath() %>/patientController" method="post"> --!>
	
	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand">
			<i class='bx bxs-plus-medical'></i>
			<span class="text">HealthPlus➕</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="patientDash.jsp">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			
			<li><a href="PatientReportDash.jsp">
					<i class='bx bxs-report' ></i>
					<span class="text">Reports</span> 
				</a>
			
			<li>
				<a href="Message.jsp">
					<i class='bx bxs-message-dots' ></i>
					<span class="text">Message</span>
				</a>
			</li>
			<li>
				<a href="#">
					<i class='bx bxs-help-circle' ></i>
					<span class="text">Help</span>
				</a>
			</li>

		
		
		
		
		
		
			<li>
				<a href="#">
					<i class='bx bxs-cog' ></i>
					<span class="text">Settings</span>
				</a>
			</li>
			<li>
				<a href="#" class="logout">
					<i class='bx bxs-log-out-circle' ></i>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- SIDEBAR -->



	<!-- CONTENT -->
	<section id="content">
		<!-- NAVBAR -->
		<nav>
			<i class='bx bx-menu' ></i>
			<a href="#" class="nav-link">Categories</a>
			<form action="#">
				<div class="form-input">
					<input type="search" placeholder="Search...">
					<button type="submit" class="search-btn"><i class='bx bx-search' ></i></button>
				</div>
			</form>
			<!-- Dark mode button -->
			<input type="checkbox" id="switch-mode" hidden>
			<label for="switch-mode" class="switch-mode"></label>
			<script>
			const checkbox = document.getElementById('switch-mode');

			checkbox.addEventListener('change', ()=>{
			  document.body.classList.toggle('dark');
			})</script>
			
			<a href="#" class="notification">
				<i class='bx bxs-bell' ></i>
				<span class="num">8</span>
			</a>
			<a href="#" class="profile">
				<img src="https://scontent.fbir5-1.fna.fbcdn.net/v/t39.30808-6/255152039_10219051301662390_696659633327268217_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=P9QrjmME1j0AX_PfaSE&_nc_oc=AQmeQbjyBqamf1j4_ovYZ-dYbz8zlPmZKx29Rnb_wZo9YFrQnsLNvseNbP3FOd3Q3rk&_nc_ht=scontent.fbir5-1.fna&oh=00_AfA9PgjJRvT77m18APj84mQtUJCiAX4XJZMSS8IXNvEQVw&oe=6396ECE2">
			</a>
		</nav>
		<!-- NAVBAR -->

		<!-- MAIN -->
		<%
  Calendar c = Calendar.getInstance();
  int hourOfDay = c.get(Calendar.HOUR_OF_DAY);
  String greeting = "";
  if (hourOfDay >= 0 && hourOfDay < 12) {
    greeting = "Good morning!";
  } else if (hourOfDay >= 12 && hourOfDay < 18) {
    greeting = "Good afternoon!";
  } else {
    greeting = "Good evening!";
  }
%>


		<main>
			<div class="head-title">
				<div class="left">
					<h1><%= greeting %>  <%=session.getAttribute("fname")%> <%=session.getAttribute("lname")%></h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Dashboard</a>
						</li>
						<li><i class='bx bx-chevron-right' ></i></li>
						<li>
							<a class="active" href="#">Home</a>
						</li>
					</ul>
				</div>
				
			</div>

			<ul class="box-info">
				<li>
					<i class='bx bxs-calendar-check' ></i>
					<span class="text">
						<h3>XX</h3>
						<p>New Appointments</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-group' ></i>
					<span class="text">
						<h3>XX</h3>
						<p>Patients</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-dollar-circle' ></i>
					<span class="text">
						<h3>$XX.XX</h3>
						<p>Income</p>
					</span>
				</li>
			</ul>


			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Appointments</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<%!List<String[]> dataList = new ArrayList<String[]>(); %>
				<%DbConnection db=new DbConnection();
				Object p_Id=session.getAttribute("id"); 
				int id = (int) p_Id; 
				String query="SELECT CONCAT(p_Fname, ' ', p_Lname) AS patient_name, CONCAT(d_Fname, ' ', d_Lname) AS doctor_name, a.app_date, a.app_time FROM appointment a INNER JOIN patient p ON a.p_Id = p.p_Id INNER JOIN doctor d ON a.d_Id = d.d_Id WHERE a.p_Id=" +id;
				try {
		ResultSet rs = db.retrieve(query);
		
		
		  
		  // Iterate through results and add to list
		  while (rs.next()) {
		    String[] rowData = new String[6];
		    rowData[0] = rs.getString("patient_name");
		    rowData[1] = rs.getString("doctor_name");
		    rowData[2] = rs.getString("app_date");
		    rowData[3] = rs.getString("app_time");
		    
		    dataList.add(rowData);
		  }
		  
		  // Close connection to database
		  rs.close();
		} catch(Exception e){}
				%>	
					<table>
						<thead>
							<tr>
								<th>Patient name</th>
								<th>Doctor name</th>
								<th>Date</th>
								<th>Time</th>
							</tr>
						</thead>
						<%
    for (String[] rowData : dataList) {
  %>
						<tbody>
						
							<tr>
    <td><%= rowData[0] %></td>
    <td><%= rowData[1] %></td>
    <td><%= rowData[2] %></td>
    <td><%= rowData[3] %></td>
    
  </tr>
  <%
    }
  %>
						</tbody>
					</table>
				</div>
				<div class="todo">
					<div class="head">
						<h3>Schedule Appointments</h3>
						<i class='bx bx-plus' ></i>
						<i class='bx bx-filter' ></i>
					</div>

<div id="white-background">
</div>
<div id="dlgbox">
    <div id="dlg-header">Get an Appointment</div>
    <div id="dlg-body">
    <form action="<%= request.getContextPath()%>/AppointmentController" method="post">
  <%
  // Connect to the database and retrieve data for the first dropdown list
  String firstDropdownData = "";
  String secondDropdownData = "";
  String thirdDropdownData = "";
  String forthDropdownData = "";
  String fifthDropdownData = "";

    DbConnection db1 = new DbConnection();
	String query1 = "select * from speciality;";
	try {
		ResultSet rs = db.retrieve(query1);
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
<select id="secondDropdown" onchange="updateThirdDropdown()" name="d_Id">
  <option value="" disabled selected>Doctor</option>
<%= secondDropdownData %>
</select>
<!-- Third dropdown list -->
<select id="thirdDropdown" onchange="updateForthDropdown(),updateFifthDropdown()" name="app_date">
  <option value="" disabled selected>Date</option>
<%= thirdDropdownData %>
</select>

<!-- Fourth dropdown list -->
<select id="forthDropdown" name="app_time">
  <option value="" disabled selected>From</option>
<%= forthDropdownData %>
</select>

<!-- Third dropdown list -->
<select id="fifthDropdown">
  <option value="" disabled selected>To</option>
<%= fifthDropdownData %>
</select>
<input type="hidden" name="id" value="<%= session.getAttribute("id") %>">

					<button type="submit" class="btn btn-primary">Confirm</button>
</form></div>
    <div id="dlg-footer">
        <button onclick="dlgOK()">OK</button>
        <button onclick="dlgCancel()">Cancel</button>
    </div>
</div>

<!-- rest of the page -->

<button class="button1"onclick="showDialog()">Add New</button>

<!-- script of dialog -->
<script>
    function dlgCancel(){
        dlgHide();
    
    }

    function dlgOK(){
        dlgHide();
      
    }

    function dlgHide(){
        var whitebg = document.getElementById("white-background");
        var dlg = document.getElementById("dlgbox");
        whitebg.style.display = "none";
        dlg.style.display = "none";
    }

    function showDialog(){
        var whitebg = document.getElementById("white-background");
        var dlg = document.getElementById("dlgbox");
        whitebg.style.display = "block";
        dlg.style.display = "block";

        var winWidth = window.innerWidth;

        dlg.style.left = (winWidth/2) - 480/2 + "px";
        dlg.style.top = "150px";
    }
</script> <style>
        #white-background{
            display: none;
            width: 100%;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #fefefe;
            opacity: 0.7;
            z-index: 9999;
        }
		
        #dlgbox{
            /*initially dialog box is hidden*/
            display: none;
            position: fixed;
            width: 480px;
            z-index: 9999;
            border-radius: 10px;
            background-color: #7c7d7e;
        }

        #dlg-header{
            background-color: #6d84b4;
            color: white;
            font-size: 20px;
            padding: 10px;
            margin: 10px 10px 0 10px;
        }

        #dlg-body{
            background-color: white;
            color: black;
            font-size: 14px;
            padding: 10px;
            margin: 0 10px 0 10px;
        }

        #dlg-footer{
            background-color: #f2f2f2;
            text-align: right;
            padding: 10px;
            margin: 0 10px 10px 10px;
        }

        #dlg-footer button{
            background-color: #6d84b4;
            color: white;
            padding: 5px;
            border: 0;
        }
    </style>

					<ul class="todo-list">
					
					<li class="completed">
							<p>Dec 5-12:12pm</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
						<li class="completed">
							<p>Dec 5-12:12pm</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
						<li class="not-completed">
							<p>Dec 5-12:12pm</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
						<li class="completed">
							<p>Dec 5-12:12pm</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
						<li class="not-completed">
							<p>Dec 5-12:12pm</p>
							<i class='bx bx-dots-vertical-rounded' ></i>
						</li>
					</ul>
				</div>
			</div>
		</main>
		<label for="meeting-time"></label>


		
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->
	



</body>
</html>