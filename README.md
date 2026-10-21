# Hospital Appointment System

## Project Overview

The Hospital Appointment System is a web-based application developed to simplify the process of managing hospital appointments. It provides an interface for patients to register, log in, view available doctors, and manage appointment-related activities.

The application is built using Java web technologies and MySQL for database management.

## Features

- **User Registration:** Allows new users to create an account.
- **User Login and Logout:** Provides authentication functionality for users.
- **Doctor Listing:** Displays information about available doctors.
- **Appointment Booking:** Allows patients to book hospital appointments.
- **Appointment Management:** Provides pages to view appointment-related information.
- **Patient Management:** Organizes patient-related information.
- **Database Connectivity:** Uses JDBC to interact with the MySQL database.
- **Form Validation:** Uses JavaScript for client-side input validation.

## Technologies Used

- **Backend:** Java, Java Servlets, JSP
- **Database:** MySQL
- **Database Connectivity:** JDBC
- **Frontend:** HTML, CSS, JavaScript, Bootstrap
- **Web Server:** Apache Tomcat
- **Development Tools:** Eclipse IDE, Git, GitHub

## Project Structure

```text
HospitalAppointmentSystem/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/project/
│       │       ├── controller/   # Servlet classes
│       │       ├── DAO/          # Database access classes
│       │       ├── model/        # Model classes
│       │       └── utility/      # Database connection utilities
│       └── webapp/
│           ├── images/           # Image resources
│           ├── WEB-INF/          # Web configuration and libraries
│           ├── login.jsp
│           ├── register.jsp
│           ├── doctors.jsp
│           ├── patients.jsp
│           ├── appointments.jsp
│           ├── bookAppointment.jsp
│           └── dashboard.jsp
├── README.md
└── .gitignore
```

## Prerequisites

Make sure the following software is installed:

- JDK
- Eclipse IDE for Enterprise Java and Web Developers
- Apache Tomcat
- MySQL Server
- MySQL Connector/J

## Installation and Setup

1. Clone the repository:

   ```bash
   git clone https://github.com/kouushik25/HospitalAppointmentSystem.git
   ```

2. Open Eclipse IDE and import the project into your workspace.

3. Configure Apache Tomcat in Eclipse and associate it with the project.

4. Create the required MySQL database and tables according to the application's SQL queries.

5. Configure the database connection details in the database connection utility class.

6. Ensure that the MySQL Connector/J library is available to the project.

7. Run the project on Apache Tomcat.

8. Open the application in your browser using the local URL provided by Tomcat.

## Database Configuration

Update the database connection settings in the database connection utility class with your local MySQL configuration.

Configure the following values according to your environment:

- Database URL
- Database username
- Database password

**Note:** Do not commit actual database passwords or other sensitive credentials to GitHub.

## Learning Outcomes

This project demonstrates practical implementation of:

- Java-based web application development
- Servlet and JSP request handling
- JDBC-based database operations
- MVC-style separation of controllers, models, and data access
- User authentication and form validation
- Integration of frontend technologies with backend services
- Version control using Git and GitHub

## Author

**Koushik**

GitHub: [@kouushik25](https://github.com/kouushik25)

## Repository

[Hospital Appointment System on GitHub](https://github.com/kouushik25/HospitalAppointmentSystem)
