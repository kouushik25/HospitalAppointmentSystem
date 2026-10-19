<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="authCheck.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.DoctorModel" %>

<%
@SuppressWarnings("unchecked")
List<DoctorModel> doctors =
        (List<DoctorModel>) request.getAttribute("doctors");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Book Appointment - ABC Hospitals</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body {
            background-color: #f2f8ff;
        }

        .appointment-box {
            max-width: 500px;
            margin: 50px auto;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-dark bg-primary">
    <div class="container">
        <span class="navbar-brand">ABC Hospitals</span>

        <a href="dashboard.jsp" class="btn btn-light">
            Dashboard
        </a>
    </div>
</nav>


<div class="container">

    <div class="card shadow appointment-box">

        <div class="card-body">

            <h2 class="text-center text-primary mb-4">
                Book Appointment
            </h2>
				<%
				String errorMessage = (String) request.getAttribute("errorMessage");
				if (errorMessage != null) {
				%>
				<div class="alert alert-danger">
					<%=errorMessage%>
				</div>
				<%
				}
				%>
				<form action="AppointmentServlet" method="post"
					onsubmit="return validateForm()">

					<!-- Doctor -->
					<label>Doctor</label>
					 <select id="doctorId" name="doctorId"
						class="form-control" required onchange="validateDoctor()">

						<option value="">Select Doctor</option>

						<%
						for (DoctorModel doctor : doctors) {
						%>
						<option value="<%=doctor.getDoctorId()%>">
							<%=doctor.getDoctorName()%> -
							<%=doctor.getSpecialization()%>
						</option>
						<%
						}
						%>

					</select>
					 <small id="doctorError" class="text-danger d-block mb-3"></small>


					<!-- Appointment Date -->
					<label>Appointment Date</label> <input type="date"
						id="appointmentDate" name="appointmentDate" class="form-control"
						required  onchange="validateDate()">
						 <small id="dateError"
						class="text-danger d-block mb-3"></small>


					<!-- Appointment Time -->
					<label>Appointment Time</label> <input type="time"
						id="appointmentTime" name="appointmentTime" class="form-control"
						required onchange="validateTime()">
						 <small id="timeError"
						class="text-danger d-block mb-3"></small>


					<button type="submit" class="btn btn-primary w-100">Book
						Appointment</button>

				</form>


				<p class="text-center mt-3">
                <a href="DoctorServlet?action=view">
                    View Doctors
                </a>
            </p>

        </div>

    </div>

</div>

	<script>
		function validateDoctor() {
			let doctor = document.getElementById("doctorId").value;
			let error = document.getElementById("doctorError");

			if (doctor == "") {
				error.innerHTML = "Please select a doctor";
				return false;
			} else {
				error.innerHTML = "";
				return true;
			}
		}

		function validateDate() {
			let date = document.getElementById("appointmentDate").value;
			let error = document.getElementById("dateError");

			let today = new Date();
			let year = today.getFullYear();
			let month = String(today.getMonth() + 1).padStart(2, "0");
			let day = String(today.getDate()).padStart(2, "0");
			let todayDate = year + "-" + month + "-" + day;

			if (date == "") {
				error.innerHTML = "Please select an appointment date";
				return false;
			} else if (date < todayDate) {
				error.innerHTML = "Appointment date cannot be in the past";
				return false;
			} else {
				error.innerHTML = "";
				return true;
			}
		}

		function validateTime() {
			let time = document.getElementById("appointmentTime").value;
			let error = document.getElementById("timeError");

			if (time == "") {
				error.innerHTML = "Please select an appointment time";
				return false;
			} else {
				error.innerHTML = "";
				return true;
			}
		}

		function validateForm() {
			let doctorValid = validateDoctor();
			let dateValid = validateDate();
			let timeValid = validateTime();

			return doctorValid && dateValid && timeValid;
		}
	</script>
</body>
</html>