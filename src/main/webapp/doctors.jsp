<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ include file="authCheck.jsp" %>
<%@ page import="java.util.List" %>
<%@ page import="com.project.model.UserModel" %>
<%@ page import="com.project.model.DoctorModel" %>

<%

List<DoctorModel> doctors =
        (List<DoctorModel>) request.getAttribute("doctors");
%>

<!DOCTYPE html>
<html>

<head>
    <title>Doctors - ABC Hospitals</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body {
            background-color: #f2f8ff;
        }

        .doctor-box {
            max-width: 600px;
            margin: 40px auto;
        }
    </style>
</head>

<body>

<nav class="navbar navbar-dark bg-primary">
    <div class="container">

        <span class="navbar-brand">
            ABC Hospitals
        </span>

        <a href="dashboard.jsp" class="btn btn-light">
            Dashboard
        </a>

    </div>
</nav>


<div class="container mt-5">

    <h2 class="text-center text-primary mb-4">
        Doctors
    </h2>


    <!-- Add Doctor - Admin Only -->

    <% if (user.getRole().equalsIgnoreCase("admin")) { %>

        <div class="card shadow doctor-box">

            <div class="card-body">

                <h4 class="text-primary text-center mb-4">
                    Add Doctor
                </h4>

                <form action="DoctorServlet" method="post" onsubmit="return validateDocForm()">

                    <label>Doctor Name</label>

                    <input type="text"
                           name="doctorName" id="doctorName"
                           class="form-control mb-3"
                           required onblur="validateDocName()" oninput="validateDocName()">
                      <small class="text-danger d-block mb-3" id="nameError"></small>


                    <label>Specialization</label>

                    <input type="text"
                           name="specialization" id="specialization"
                           class="form-control mb-3"
                           required onblur="validateSpcl()" oninput="validateSpcl()">
					<small class="text-danger d-block mb-3" id="splError"></small>

                    <label>Email</label>

                    <input type="email"
                           name="email" id="email"
                           class="form-control mb-3"
                           required onblur="validateEmail()" oninput="validateEmail()">
					<small class="text-danger d-block mb-3" id="emailError"></small>

                    <label>Phone</label>

                    <input type="text"
                           name="phone" id="phone"
                           class="form-control mb-3"
                           required onblur="validatePhone()" oninput="validatePhone()">
                     <small class="text-danger d-block mb-3" id="phoneError"></small>


                    <button type="submit"
                            class="btn btn-primary w-100">
                        Add Doctor
                    </button>

                </form>

            </div>

        </div>

    <% } %>


    <!-- Display Doctors -->

    <h3 class="text-center text-primary mt-5 mb-4">
        Available Doctors
    </h3>


    <div class="row">

        <% if (doctors != null && !doctors.isEmpty()) { %>

            <% for (DoctorModel doctor : doctors) { %>

                <div class="col-md-4 mb-4">

                    <div class="card shadow h-100">

                        <div class="card-body">

                            <h5 class="card-title">
                                <%= doctor.getDoctorName() %>
                            </h5>

                            <p>
                                <strong>Specialization:</strong>
                                <%= doctor.getSpecialization() %>
                            </p>

                            <p>
                                <strong>Email:</strong>
                                <%= doctor.getEmail() %>
                            </p>

                            <p>
                                <strong>Phone:</strong>
                                <%= doctor.getPhone() %>
                            </p>

                            <% if (user.getRole().equalsIgnoreCase("patient")) { %>

                                <a href="DoctorServlet?action=book"
                                   class="btn btn-primary">
                                    Book Appointment
                                </a>

                            <% } %>

                        </div>

                    </div>

                </div>

            <% } %>

        <% } else { %>

            <div class="text-center">

                <p class="text-muted">
                    No doctors available.
                </p>

            </div>

        <% } %>

    </div>

</div>
	<script>
		
		function validateDocName() {
			let name = document.getElementById("doctorName").value.trim();
	    	if(name==""){
	    		document.getElementById("nameError").innerHTML="Name cannot be Empty";
	    		return false;
	    	}
	    	else if (!/^[A-Za-z ]+$/.test(name)) {
	    		document.getElementById("nameError").innerHTML="Name should contain only letters and spaces";
				return false;
			}else{
				document.getElementById("nameError").innerHTML="";
				return true;
			}
		}
		function validateSpcl() {
			let name = document.getElementById("specialization").value.trim();
	    	if(name==""){
	    		document.getElementById("splError").innerHTML="Specalization cannot be Empty";
	    		return false;
	    	}
	    	else if (!/^[A-Za-z ]+$/.test(name)) {
	    		document.getElementById("splError").innerHTML="Specalization should contain only letters and spaces";
				return false;
			}else{
				document.getElementById("splError").innerHTML="";
				return true;
			}
		}
		function validateEmail() {
			let email = document.getElementById("email").value.trim();
	 		if(email==""){
	 			document.getElementById("emailError").innerHTML="Email cannot be Empty"
	 			return false;
	 		}else{
	 			document.getElementById("emailError").innerHTML="";
	 			return true;
	 		}
		}
		function validatePhone() {
			let phone = document.getElementById("phone").value.trim();
	 		if(email==""){
	 			document.getElementById("phoneError").innerHTML="Phone number cannot be Empty"
	 			return false;
	 		}
	 		else if(!/^[0-9 ]{10}$/.test(phone)){
	 			document.getElementById("phoneError").innerHTML="Enter a valid 10-digit Phone Number";
				return false;
	 		}else{
	 			document.getElementById("phoneError").innerHTML="";
	 			return true;
	 		}
		}
		function validateDocForm(){
			  let nameValid=validateDocName();
	          let pwdValid=validateSpcl();
	          let emailValid=validateEmail();
	          let phoneValid=validatePhone();
				return nameValid &&  pwdValid && emailValid && phoneValid;
		}
	</script>
</body>
</html>