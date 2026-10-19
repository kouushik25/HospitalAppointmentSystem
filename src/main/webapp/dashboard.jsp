<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%@ include file="authCheck.jsp" %>
<!DOCTYPE html>
<html>
	<head>
    	<title>Dashboard - ABC Hospitals</title>

    	<meta name="viewport" content="width=device-width, initial-scale=1">

    	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">
	</head>

	<body>

	<nav class="navbar navbar-dark bg-primary">
    	<div class="container">
        	<span class="navbar-brand">ABC Hospitals</span>

        	<a href="LogoutServlet" class="btn btn-danger">
            Logout
        	</a>
    	</div>
	</nav>

	<div class="container mt-5">

    	<div class="card shadow">

        	<div class="card-body">

            	<h2 class="text-primary">Welcome, <%= user.getName() %></h2>

            	<p>Email: <%= user.getEmail() %></p>

            	<p>
                	Role:
                	<strong><%= user.getRole() %></strong>
            	</p>

            	<hr>

           	 <% if (user.getRole().equalsIgnoreCase("PATIENT")) { %>

                <h4>Patient Dashboard</h4>

                <a href="DoctorServlet?action=view" class="btn btn-primary mt-2">
                    View Doctors
                </a>

                <a href="DoctorServlet?action=book" class="btn btn-success mt-2">
                    Book Appointment
                </a>

                <a href="AppointmentServlet" class="btn btn-info mt-2">
                    My Appointments
                </a>

            <% } else if (user.getRole().equalsIgnoreCase("DOCTOR")) { %>

                <h4>Doctor Dashboard</h4>
                 <a href="AppointmentServlet?action=manage" class="btn btn-success mt-2">
                    Manage Appointments
                </a>

                <a href="AppointmentServlet?action=view" class="btn btn-primary mt-2">
                    View Appointments
                </a>


            <% } else if (user.getRole().equalsIgnoreCase("ADMIN")) { %>

                <h4>Admin Dashboard</h4>
                <a href="DoctorServlet?action=view" class="btn btn-primary mt-2">
                    Add/ Manage Doctors
                </a>

                <a href="AppointmentServlet" class="btn btn-success mt-2">
                    Manage Appointments
                </a>

                <a href="PatientServlet" class="btn btn-warning mt-2">
                    Manage Patients
                </a>

            <% } %>

        		</div>

    		</div>

		</div>

	</body>
</html>