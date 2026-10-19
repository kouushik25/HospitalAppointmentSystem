package com.project.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.project.DAO.DataAccess;
import com.project.model.AppointmentModel;
import com.project.model.DoctorModel;
import com.project.model.UserModel;


@WebServlet("/AppointmentServlet")
public class AppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataAccess da=new DataAccess();
		 String action = request.getParameter("action");

		    if ("updateStatus".equalsIgnoreCase(action)) {

		        int appointmentId =Integer.parseInt(request.getParameter("appointmentId"));

		        String status =request.getParameter("status");

		        da.updateAppointmentStatus(appointmentId, status);
		        response.sendRedirect("AppointmentServlet?action=manage");
		        return;
		    }

			HttpSession session = request.getSession(false);
			UserModel user = (session == null) ? null : (UserModel) session.getAttribute("user");

			if (user == null || !user.getRole().equalsIgnoreCase("patient")) {
				response.sendRedirect("login.jsp");
				return;
			}

			String doctorValue = request.getParameter("doctorId");
			String appointmentDate = request.getParameter("appointmentDate");
			String appointmentTime = request.getParameter("appointmentTime");

			// Check whether all fields are provided
			if (doctorValue == null || doctorValue.isEmpty() || appointmentDate == null || appointmentDate.isEmpty()
					|| appointmentTime == null || appointmentTime.isEmpty()) {

				request.setAttribute("errorMessage", "Please fill in all fields.");
				request.setAttribute("doctors", da.getDoctors());
				request.getRequestDispatcher("bookAppointment.jsp")
				       .forward(request, response);
				return;
			}

			// Check that the doctor ID is a valid number
			int doctorId;

			try {
				doctorId = Integer.parseInt(doctorValue);
			} catch (NumberFormatException e) {
				request.setAttribute("errorMessage", "Invalid doctor selected.");
			    request.setAttribute("doctors", da.getDoctors());
			    request.getRequestDispatcher("bookAppointment.jsp")
			           .forward(request, response);
			    return;
			}

			DoctorModel doctor = da.getDoctorById(doctorId);

			// Check that the selected doctor exists
			if (doctor == null) {
				response.sendRedirect("DoctorServlet?action=view");
				return;
			}

			// Check that the appointment date is not in the past
			try {
				java.time.LocalDate selectedDate = java.time.LocalDate.parse(appointmentDate);

				if (selectedDate.isBefore(java.time.LocalDate.now())) {
					request.setAttribute("errorMessage",
					        "Appointment date cannot be in the past.");
					request.setAttribute("doctors", da.getDoctors());
					request.getRequestDispatcher("bookAppointment.jsp")
					       .forward(request, response);
					return;
				}
			} catch (java.time.format.DateTimeParseException e) {
				response.sendRedirect("DoctorServlet?action=view");
				return;
			}

			// Create and save the appointment
			AppointmentModel am = new AppointmentModel();
			am.setUserId(user.getUserId());
			am.setDoctorId(doctorId);
			am.setAppointmentDate(appointmentDate);
			am.setAppointmentTime(appointmentTime);
			am.setStatus("Pending");
			am.setDoctorName(doctor.getDoctorName());
			am.setSpecialization(doctor.getSpecialization());

			String status = da.insertAppointment(am);

			if (status.equals("success")) {
				response.sendRedirect("AppointmentServlet");
			} else {
				response.sendRedirect("DoctorServlet?action=view");
			}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		UserModel user = (UserModel) session.getAttribute("user");

		DataAccess da = new DataAccess();

		List<AppointmentModel> list;


		if (user.getRole().equalsIgnoreCase("doctor")) {

			DoctorModel doctor = da.getDoctorByEmail(user.getEmail());

			List<AppointmentModel> allAppointments = da.getAppointmentByDoctorId(doctor.getDoctorId());

			list = new ArrayList<>();

			String action = request.getParameter("action");

			for (AppointmentModel am : allAppointments) {

				
				if ("manage".equalsIgnoreCase(action)) {

					if (am.getStatus().equalsIgnoreCase("Pending")) {
						list.add(am);
					}
				}

				
				else if ("view".equalsIgnoreCase(action)) {

					if (am.getStatus().equalsIgnoreCase("Accepted") || am.getStatus().equalsIgnoreCase("Rejected")) {

						list.add(am);
					}
				}
			}
		}
		else if(user.getRole().equalsIgnoreCase("admin")){
			list=da.getAllAppointments();
		}

		else {

			int userId = user.getUserId();

			list = da.getAppointmentByUserId(userId);
		}

		request.setAttribute("appointments", list);

		RequestDispatcher rd = request.getRequestDispatcher("appointments.jsp");

		rd.forward(request, response);
	}

}
