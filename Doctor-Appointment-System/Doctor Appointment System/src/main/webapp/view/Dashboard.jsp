<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.util.Calendar" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Calendar</title>
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,600,700" rel="stylesheet">
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
</head>
<style>
<%@
include file="/CSS/doctorDash.css"%>
</style> 

<body>
	
	<!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand">
			<i class='bx bxs-plus-medical'></i>
			<span class="text">HealthPlus➕</span>
		</a>
		<ul class="side-menu top">
			<li class="active">
				<a href="#">
					<i class='bx bxs-dashboard' ></i>
					<span class="text">Dashboard</span>
				</a>
			</li>
			<li>
				<a href="PatientReportDash.jsp">
					<i class='bx bxs-report' ></i>
					<span class="text">Reports</span>
				</a>
			</li>
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

		</ul>
		
		
		
		
		<ul class="side-menu">
			<li>
				<a href="#">
					<i class='bx bxs-cog' ></i>
					<span class="text">Settings</span>
				</a>
			</li>
			<li>
				<a href="/LogoutServlet" class="logout">
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
					<h1><%= greeting %> <%=session.getAttribute("fname")%> <%=session.getAttribute("lname")%></h1>
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
						<p>Appointments</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-group' ></i>
					<span class="text">
						<h3>XX</h3>
						<p>Visited Doctors</p>
					</span>
				</li>
				<li>
					<i class='bx bxs-dollar-circle' ></i>
					<span class="text">
						<h3>$XX.XX</h3>
						<p>Prescriptions</p>
					</span>
				</li>
			</ul>


			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Recent Appointments</h3>
						<i class='bx bx-search' ></i>
						<i class='bx bx-filter' ></i>
					</div>
					<table>
						<thead>
							<tr>
								<th>Doctor name</th>
								<th>Appointment date</th>
								<th>Time</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									<img src="https://upload.wikimedia.org/wikipedia/commons/0/04/So_happy_smiling_cat.jpg">	<p>Priyanka Rajbanshi</p>
								</td>
								<td>01-12-2022</td>
								<td>12:00pm</td>
								<td><span class="status completed">Completed</span></td>
							</tr>
							<tr>
								<td>
									<img src="https://scontent.fbir5-1.fna.fbcdn.net/v/t39.30808-6/284363140_114955714556162_2397420675985573618_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=UpRAC2FK1OsAX95u0or&_nc_ht=scontent.fbir5-1.fna&oh=00_AfAqqG0JlqveyBehrdK9lhwl95gT2fPuIsudxcABVyp2wQ&oe=639743BD">
									<p>Rabin Maharjan</p>
								</td>
								<td>01-10-2022</td>
								<td>12:30pm</td>
								<td><span class="status pending">Pending</span></td>
							</tr>
							<tr>
								<td>
									<img src="data:image/jpeg;base64,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">
									<p>Puspa</p>
								</td>
								<td>01-11-2022</td>
								<td>12:00pm</td>
								<td><span class="status process">Process</span></td>
							</tr>
							<tr>
								<td>
									<img src="https://scontent.fbir5-1.fna.fbcdn.net/v/t39.30808-6/315825779_650724780097395_7415929264220215463_n.jpg?_nc_cat=106&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=MwiO4GySv_oAX_MZwnF&tn=TwNXRXpVBk69gf_I&_nc_ht=scontent.fbir5-1.fna&oh=00_AfAPtKRa5QyLonKasrtxBraEfVJIYWlsD4-CE64en4XV_Q&oe=63967185">
									<p>Rejita Shrestha</p>
								</td>
								<td>01-01-2023</td>
								<td>12:00pm</td>
								<td><span class="status pending">Pending</span></td>
							</tr>
							<tr>
								<td>
									<img src="https://images.theconversation.com/files/430483/original/file-20211105-9897-18ahqx2.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=1200&h=1200.0&fit=crop">
									<p>Panda</p>
								</td>
								<td>01-02-2023</td>
								<td>12:00pm</td>
								<td><span class="status completed">Completed</span></td>
							</tr>
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
    <div id="dlg-header">Select date and time</div>
    <div id="dlg-body"><form>
  <label for="appointmentdaytime">Appointment (date and time):</label>
  <input type="datetime-local" id="time" name="time">
  <input type="submit">
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
		<label for="meeting-time">Choose a time for your appointment:</label>


		
		<!-- MAIN -->
	</section>
	<!-- CONTENT -->
	



</body>
</html>