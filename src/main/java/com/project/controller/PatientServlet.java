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
import com.project.model.UserModel;


@WebServlet("/PatientServlet")
public class PatientServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DataAccess da=new DataAccess();
		List<UserModel>patients=da.getAllPatients();
		request.setAttribute("patients", patients);
		RequestDispatcher rd=request.getRequestDispatcher("patients.jsp");
		rd.forward(request, response);
	}

}
