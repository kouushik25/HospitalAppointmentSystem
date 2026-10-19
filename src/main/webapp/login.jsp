<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Login - ABC Hospitals</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <style>
        body {
            background-color: #f2f8ff;
        }

        .login-box {
            max-width: 400px;
            margin: 100px auto;
        }
    </style>
</head>

<body>

<div class="container">

    <div class="card shadow login-box">

        <div class="card-body">

            <h2 class="text-center text-primary">ABC Hospitals</h2>
            <p class="text-center">Login</p>
              <% 
            String errorMessage =
                    (String) request.getAttribute("errormsg");

            if (errorMessage != null) {
            %>
                <p class="text-danger text-center">
                    <%= errorMessage %>
                </p>
            <% 
            } 
            %>

            <form action="LoginServlet" method="post" onsubmit="return valiadteForm()">

                <label>Email</label>
                <input type="email" name="email" id="email"
                       class="form-control mb-3" required onblur="validateEmail()">
                 <small class="text-danger d-block mb-3" id="emailError"></small>

                <label>Password</label>
                <input type="password" name="password" id="password"
                       class="form-control mb-3" required onblur="validatePassword()">
                  <small class="text-danger d-block mb-3" id="pwdError"></small>      
                       

                <button type="submit"
                        class="btn btn-primary w-100">
                    Login
                </button>

            </form>

            <p class="text-center mt-3">
                Don't have an account?
                <a href="register.jsp">Register</a>
            </p>

            <p class="text-center">
                <a href="index.jsp">Back to Home</a>
            </p>

        </div>

    </div>

</div>
	<script>
	 	function validateEmail(){
	 		let email = document.getElementById("email").value.trim();
	 		if(email==""){
	 			document.getElementById("emailError").innerHTML="Email cannot be Empty"
	 			return false;
	 		}else{
	 			document.getElementById("emailError").innerHTML="";
	 			return true;
	 		}
	 	}
	 	function validatePassword(){
	 		let pwd = document.getElementById("password").value;
	 		if(pwd==""){
	 			document.getElementById("pwdError").innerHTML="Password cannot be Empty"
	 			return false;
	 		}else{
	 			document.getElementById("pwdError").innerHTML="";
	 			return true;
	 		}
	 	}
	 	function validateForm() {
            let emailValid=validateEmail();
            let pwdValid=validatePassword();
			return emailValid &&  pwdValid;
		}
	</script>
</body>
</html>