package com.project.DAO;

import java.util.List;

import com.project.model.AppointmentModel;
import com.project.model.DoctorModel;
import com.project.model.UserModel;

public interface DataAccessInterface {
	 String insert(UserModel um);
	 UserModel login(String email,String password) ;
	 List<DoctorModel>getDoctors();
	 String insertAppointment(AppointmentModel am);
	 String insertDoctor(DoctorModel um);
	 DoctorModel getDoctorById(int doctorId);
	 List<AppointmentModel>getAppointmentByUserId(int userId);
	 List<AppointmentModel> getAppointmentByDoctorId(int doctorId);
	 String updateAppointmentStatus(int appointmentId, String status);
	 DoctorModel getDoctorByEmail(String email);
	 List<AppointmentModel>getAllAppointments();
	 List<UserModel>getAllPatients();
}
