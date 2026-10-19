package com.project.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.project.DAO.DataAccess;
import com.project.model.DoctorModel;
import com.project.model.UserModel;


@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		UserModel um=new UserModel();
		um.setName(name);
		um.setEmail(email);
		um.setPassword(password);
		DataAccess da=new DataAccess();
		DoctorModel doctor=da.getDoctorByEmail(email);
		if(doctor!=null) {
			um.setRole("doctor");
		}else {
		um.setRole("Patient");
		}
		
		String status=da.insert(um);
		if(status.equals("success")) {
			RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
		}else {
			request.setAttribute("errormsg", "Email already Registered.Please use another email");
			RequestDispatcher rd=request.getRequestDispatcher("register.jsp");
			rd.forward(request, response);
		}
	}

}
