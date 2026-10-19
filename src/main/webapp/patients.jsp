<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="authCheck.jsp" %>
<%@ page import="java.util.List"%>
<%@ page import="com.project.model.UserModel"%>

<%

List<UserModel> patients = (List<UserModel>) request.getAttribute("patients");
%>

<!DOCTYPE html>
<html>

<head>

<title>Manage Patients - ABC Hospitals</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background-color: #f2f8ff;
}

.patient-box {
	max-width: 800px;
	margin: 50px auto;
}
</style>

</head>

<body>

	<nav class="navbar navbar-dark bg-primary">

		<div class="container">

			<span class="navbar-brand"> ABC Hospitals </span> <a
				href="dashboard.jsp" class="btn btn-light"> Dashboard </a>

		</div>

	</nav>


	<div class="container">

		<div class="card shadow patient-box">

			<div class="card-body">

				<h2 class="text-center text-primary mb-4">Manage Patients</h2>

				<%
				if (patients != null && !patients.isEmpty()) {
				%>

				<table class="table table-bordered">

					<thead>

						<tr>
							<th>Patient ID</th>
							<th>Name</th>
							<th>Email</th>
						</tr>

					</thead>

					<tbody>

						<%
						for (UserModel patient : patients) {
						%>

						<tr>

							<td><%=patient.getUserId()%></td>

							<td><%=patient.getName()%></td>

							<td><%=patient.getEmail()%></td>

						</tr>

						<%
						}
						%>

					</tbody>

				</table>

				<%
				} else {
				%>

				<div class="alert alert-info text-center">No patients found.</div>

				<%
				}
				%>

			</div>

		</div>

	</div>

</body>

</html>