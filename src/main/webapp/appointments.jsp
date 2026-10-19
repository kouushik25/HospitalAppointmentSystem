<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="authCheck.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.AppointmentModel" %>
<%@ page import="com.project.model.UserModel" %>
<%
List<AppointmentModel> appointments =
        (List<AppointmentModel>) request.getAttribute("appointments");
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Appointments - ABC Hospitals</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body {
            background-color: #f2f8ff;
        }

        .appointment-box {
            max-width: 700px;
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
                My Appointments
            </h2>

            <% if (appointments != null && !appointments.isEmpty()) { %>

                <% for (AppointmentModel appointment : appointments) { %>

                    <div class="border rounded p-3 mb-4">

                        <p>
                            <strong>Doctor:</strong>
                            <%= appointment.getDoctorName() %>
                        </p>

                        <p>
                            <strong>Specialization:</strong>
                            <%= appointment.getSpecialization() %>
                        </p>

                        <p>
                            <strong>Appointment Date:</strong>
                            <%= appointment.getAppointmentDate() %>
                        </p>

                        <p>
                            <strong>Appointment Time:</strong>
                            <%= appointment.getAppointmentTime() %>
                        </p>

                        <p>
                            <strong>Status:</strong>
                            <%= appointment.getStatus() %>
                        </p>
					<%
					if (user != null && user.getRole().equalsIgnoreCase("doctor") && appointment.getStatus().equalsIgnoreCase("Pending")) {
					%>

					<form action="AppointmentServlet" method="post" class="d-inline">

						<input type="hidden" name="action" value="updateStatus"> <input
							type="hidden" name="appointmentId"
							value="<%=appointment.getAppointmentId()%>">

						<button type="submit" name="status" value="Accepted"
							class="btn btn-success">Accept</button>

						<button type="submit" name="status" value="Rejected"
							class="btn btn-danger">Reject</button>

					</form>

					<%
					}
					%>

				</div>

                <%
                }
                %>

            <%
            } else {
            %>

                <div class="alert alert-info text-center">
                    No appointments found.
                </div>

            <% } %>

        </div>

    </div>

</div>

</body>
</html>