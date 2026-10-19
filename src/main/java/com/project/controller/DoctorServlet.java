package com.project.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import com.project.DAO.DataAccess;
import com.project.model.DoctorModel;


@WebServlet("/DoctorServlet")
public class DoctorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		DataAccess da=new DataAccess();
		List<DoctorModel>list=da.getDoctors();
		request.setAttribute("doctors", list);
		RequestDispatcher rd = null;
		if("book".equalsIgnoreCase(action)) {
		rd=request.getRequestDispatcher("bookAppointment.jsp");
		}else {
			rd=request.getRequestDispatcher("doctors.jsp");
		}
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String doctorName = request.getParameter("doctorName");
		String specialization = request.getParameter("specialization");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");

		DoctorModel dm = new DoctorModel();

		dm.setDoctorName(doctorName);
		dm.setSpecialization(specialization);
		dm.setEmail(email);
		dm.setPhone(phone);
		DataAccess da = new DataAccess();

		da.insertDoctor(dm);

		List<DoctorModel> list = da.getDoctors();

		request.setAttribute("doctors", list);

		RequestDispatcher rd = request.getRequestDispatcher("doctors.jsp");

		rd.forward(request, response);
	}
}
