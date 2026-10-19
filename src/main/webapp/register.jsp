<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Register - ABC Hospitals</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body {
            background-color: #f2f8ff;
        }

        .register-box {
            max-width: 400px;
            margin: 50px auto;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="card shadow register-box">

        <div class="card-body">

            <h2 class="text-center text-primary">ABC Hospitals</h2>
            <p class="text-center">Create Account</p>
				

				<form action="RegisterServlet" method="post" onsubmit="return validateForm()">

                <label>Name</label>
                <input type="text" name="name" id="name"
                       class="form-control mb-3"  required onblur="validateName()" oninput="validateName()">
				<small class="text-danger d-block mb-3" id="nameError"></small>
				
                <label>Email</label>
                <input type="email" name="email"
                       class="form-control mb-3"  required>
                       <%
				String errorMessage = (String) request.getAttribute("errormsg");

				if (errorMessage != null) {
				%>
				<p class="text-danger text-center">
					<%=errorMessage%>
				</p>
				<%
				}
				%>

                <label>Password</label>
                <input type="password" name="password" id="password"
                       class="form-control mb-3"  required onblur="validatePwd()" oninput="validatePwd()">
				<small class="text-danger d-block mb-3" id="pwdError"></small>
				
                <button type="submit"
                        class="btn btn-primary w-100">
                    Register
                </button>

            </form>

            <p class="text-center mt-3">
                Already have an account?
                <a href="login.jsp">Login</a>
            </p>

            <p class="text-center">
                <a href="index.jsp">Back to Home</a>
            </p>

        </div>

    </div>

</div>
	<script>
	    function validateName(){
	    	let name = document.getElementById("name").value.trim();
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

	
		function validatePwd() {
			let pwd = document.getElementById("password").value;
			if(pwd==""){
	    		document.getElementById("pwdError").innerHTML="Password cannot be Empty";
	    		return false;
	    	}
			else if(pwd.length<8){
				document.getElementById("pwdError").innerHTML="Password must contain at least 8 characters";
				return false;
			}
			else if (!/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$!%*?&])[A-Za-z\d@#$!%*?&]{8,}$/
					.test(pwd)) {
				document.getElementById("pwdError").innerHTML="Include uppercase, lowercase, number and special character";
				return false;
			}else{
				document.getElementById("pwdError").innerHTML="";
				return true;
			}
		}
		function validateForm() {
            let nameValid=validateName();
            let pwdValid=validatePwd();
			return nameValid &&  pwdValid;
		}
	</script>
</body>
</html>