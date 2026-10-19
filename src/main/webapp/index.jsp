
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ABC Hospitals</title>
  
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
        rel="stylesheet">

    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js">
    </script>

    <style>

        body {
            padding-top: 70px;
        }

        .hospital-header {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
            padding: 15px;
        }

        .hospital-header img {
            max-height: 65px;
        }

        .hospital-header h1 {
            color: blue;
            margin: 0;
        }

        .carousel-item img {
            height: 450px;
            object-fit: cover;
        }

        @media (max-width: 768px) {

            .carousel-item img {
                height: 250px;
            }

            .carousel-caption h1 {
                font-size: 24px;
            }

            .carousel-caption p {
                font-size: 14px;
            }

        }

        .feature-card {
            height: 100%;
        }

        footer {
            margin-top: 40px;
        }

    </style>

</head>

<body>


    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">

        <div class="container">

            <a class="navbar-brand fw-bold" href="index.jsp">
                ABC Hospitals
            </a>

            <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarnav">

                <span class="navbar-toggler-icon"></span>

            </button>

            <div class="collapse navbar-collapse" id="navbarnav">

                <ul class="navbar-nav me-auto">

                    <li class="nav-item">
                        <a class="nav-link active" href="index.jsp">
                            Home
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#about">
                            About
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#services">
                            Services
                        </a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="doctors.jsp">
                            Doctors
                        </a>
                    </li>

                </ul>

                <a href="login.jsp" class="btn btn-light me-2">
                    Login
                </a>

            </div>

        </div>

    </nav>


    <div class="hospital-header">

        <img src="images/img1.png" class="img-fluid" alt="Hospital Logo">

        <h1>ABC Hospitals</h1>

    </div>


    <div class="container-fluid p-0">

        <div
            id="mycrsl"
            class="carousel slide"
            data-bs-ride="carousel">


            <div class="carousel-indicators">

                <button
                    class="active"
                    type="button"
                    data-bs-target="#mycrsl"
                    data-bs-slide-to="0">
                </button>

                <button
                    type="button"
                    data-bs-target="#mycrsl"
                    data-bs-slide-to="1">
                </button>

                <button
                    type="button"
                    data-bs-target="#mycrsl"
                    data-bs-slide-to="2">
                </button>

            </div>


            <div class="carousel-inner">


                <div class="carousel-item active">

                    <img
                        src="images/img2.jpg"
                        class="d-block w-100"
                        alt="ABC Hospital">

                    <div class="carousel-caption">

                        <h1 class="text-dark fw-bold">
                            Welcome to ABC Hospitals
                        </h1>

                        <p class="text-dark fw-bold">
                            Your Health, Our Priority
                        </p>

                        <a
                            href="login.jsp"
                            class="btn btn-primary">
                            Book Appointment
                        </a>

                    </div>

                </div>


                <div class="carousel-item">

                    <img
                        src="images/img3.jpg"
                        class="d-block w-100"
                        alt="Hospital Services">

                </div>


                <div class="carousel-item">

                    <img
                        src="images/img4.jpg"
                        class="d-block w-100"
                        alt="Hospital Care">

                </div>

            </div>

            <button
                class="carousel-control-prev"
                type="button"
                data-bs-target="#mycrsl"
                data-bs-slide="prev">

                <span class="carousel-control-prev-icon"></span>

            </button>

            <button
                class="carousel-control-next"
                type="button"
                data-bs-target="#mycrsl"
                data-bs-slide="next">

                <span class="carousel-control-next-icon"></span>

            </button>

        </div>

    </div>

    <section id="about" class="container py-5">

        <h2 class="text-center text-primary mb-3">
            About ABC Hospitals
        </h2>

        <p class="text-center">
            ABC Hospitals provides quality healthcare services with
            experienced doctors, modern medical facilities and
            patient-focused care.
        </p>

    </section>

    <section class="container-fluid py-5">

        <h2 class="text-center mb-4">
            Why Choose Us?
        </h2>

        <div class="container">

            <div class="row g-4 text-center">


                <div class="col-12 col-sm-6 col-md-3">

                    <div class="card shadow p-3 feature-card">

                        <h4>🏥 24/7 Emergency</h4>

                        <p>
                            Emergency care available
                            throughout the day.
                        </p>

                    </div>

                </div>


                <div class="col-12 col-sm-6 col-md-3">

                    <div class="card shadow p-3 feature-card">

                        <h4>👨‍⚕️ Expert Doctors</h4>

                        <p>
                            Experienced and qualified
                            medical specialists.
                        </p>

                    </div>

                </div>


                <div class="col-12 col-sm-6 col-md-3">

                    <div class="card shadow p-3 feature-card">

                        <h4>🩺 Modern Facilities</h4>

                        <p>
                            Modern equipment and
                            healthcare facilities.
                        </p>

                    </div>

                </div>


                <div class="col-12 col-sm-6 col-md-3">

                    <div class="card shadow p-3 feature-card">

                        <h4>💰 Affordable Care</h4>

                        <p>
                            Quality healthcare at
                            reasonable cost.
                        </p>

                    </div>

                </div>

            </div>

        </div>

    </section>

    <section id="services" class="container py-5">

        <h2 class="text-center text-primary mb-4">
            Our Services
        </h2>

        <div class="row g-4 text-center">

            <div class="col-12 col-md-4">

                <div class="card shadow p-4 h-100">

                    <h4>🩺 General Medicine</h4>

                    <p>
                        Consultation and treatment
                        for common health conditions.
                    </p>

                </div>

            </div>


            <div class="col-12 col-md-4">

                <div class="card shadow p-4 h-100">

                    <h4>❤️ Cardiology</h4>

                    <p>
                        Specialized care for
                        heart-related conditions.
                    </p>

                </div>

            </div>


            <div class="col-12 col-md-4">

                <div class="card shadow p-4 h-100">

                    <h4>🚑 Emergency Care</h4>

                    <p>
                        Quick medical assistance
                        for emergency situations.
                    </p>

                </div>

            </div>

        </div>

    </section>


    <section class="container-fluid bg-primary text-white py-5">

        <div class="container text-center">

            <h2>
                Need a Doctor?
            </h2>

            <p>
                Book an appointment with our experienced doctors.
            </p>

            <a
                href="login.jsp"
                class="btn btn-warning">
                Book Appointment
            </a>

        </div>

    </section>

    <footer class="container-fluid bg-dark text-white py-4">

        <div class="container">
            <div class="row">
                <div class="col-12 col-md-4 mb-3">

                    <h5>ABC Hospitals</h5>
                    <p>
                        Quality Healthcare with
                        care and excellence.
                    </p>

                </div>

                <div class="col-12 col-md-4 mb-3">

                    <h5>Contact Us</h5>

                    <p>📍 Hyderabad, India</p>

                    <p>📞 +91 9876543210</p>

                    <p>✉️ info@abchospitals.com</p>

                </div>

                <div class="col-12 col-md-4 mb-3">

                    <h5>Quick Links</h5>

                    <p>
                        <a
                            href="login.jsp"
                            class="text-white text-decoration-none">
                            Login
                        </a>
                    </p>

                    <p>
                        <a
                            href="register.jsp"
                            class="text-white text-decoration-none">
                            Register
                        </a>
                    </p>

                    <p>
                        <a
                            href="doctors.jsp"
                            class="text-white text-decoration-none">
                            Doctors
                        </a>
                    </p>

                </div>

            </div>

            <hr>

            <p class="text-center mb-0">
                © 2026 ABC Hospitals. All Rights Reserved.s
            </p>

        </div>

    </footer>

</body>
</html>
