package com.project.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.project.model.AppointmentModel;
import com.project.model.DoctorModel;
import com.project.model.UserModel;
import com.project.utility.DBConnection;

public class DataAccess implements DataAccessInterface {
	Connection con = null;
	String status = "fail";
	DBConnection db = new DBConnection();

	@Override
	public String insert(UserModel um) {
		try {
			con = db.getConnection();
			PreparedStatement ps = con
					.prepareStatement("insert into users(name,email,user_password,role)values(?,?,?,?)");
			ps.setString(1, um.getName());
			ps.setString(2, um.getEmail());
			ps.setString(3, um.getPassword());
			ps.setString(4, um.getRole());
			int n = ps.executeUpdate();
			if (n > 0) {
				status = "success";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	@Override
	public UserModel login(String email, String password) {
		UserModel um = null;
		try {
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from users where email=? and user_password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				um = new UserModel();
				um.setUserId(rs.getInt("user_id"));
				um.setName(rs.getString("name"));
				um.setEmail(rs.getString("email"));
				um.setPassword(rs.getString("user_password"));
				um.setRole(rs.getString("role"));
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return um;
	}

	@Override
	public List<DoctorModel> getDoctors() {
		List<DoctorModel> list = new ArrayList<>();

		try {
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from doctors");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				DoctorModel dm = new DoctorModel();
				dm.setDoctorId(rs.getInt("doctor_id"));
				dm.setDoctorName(rs.getString("doctor_name"));
				dm. setSpecialization(rs.getString("specalization"));
				dm.setEmail(rs.getString("email"));
				dm.setPhone(rs.getString("phone"));
				list.add(dm);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	@Override
	public String insertAppointment(AppointmentModel am) {
		try {
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"insert into appointments(user_id,doctor_id,appointment_date,appointment_time,status)values(?,?,?,?,?)");
			ps.setInt(1, am.getUserId());
			ps.setInt(2, am.getDoctorId());
			ps.setString(3, am.getAppointmentDate());
			ps.setString(4, am.getAppointmentTime());
			ps.setString(5, am.getStatus());
			int n = ps.executeUpdate();
			if (n > 0) {
				status = "success";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	@Override
	public String insertDoctor(DoctorModel dm) {
		try {
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement(
					"insert into doctors(doctor_name,specalization,email,phone)values(?,?,?,?)");
			ps.setString(1,dm.getDoctorName());
			ps.setString(2,dm.getSpecialization());
			ps. setString(3,dm.getEmail());
			ps.setString(4,dm.getPhone());
			
			int n = ps.executeUpdate();
			if (n > 0) {
				status = "success";
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
		
	}
	@Override
	public DoctorModel getDoctorById(int doctorId) {

	    DoctorModel dm = null;

	    try {
	        con = db.getConnection();

	        PreparedStatement ps = con.prepareStatement(
	            "select * from doctors where doctor_id=?"
	        );

	        ps.setInt(1, doctorId);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {

	            dm = new DoctorModel();

	            dm.setDoctorId(rs.getInt("doctor_id"));
	            dm.setDoctorName(rs.getString("doctor_name"));
	            dm.setSpecialization(rs.getString("specalization"));
	            dm.setEmail(rs.getString("email"));
	            dm.setPhone(rs.getString("phone"));
	        }

	    } catch (Exception e) {
	        System.out.println(e);
	    }

	    return dm;
	}

	@Override
	public List<AppointmentModel> getAppointmentByUserId(int userId) {
		List<AppointmentModel> list = new ArrayList<>();

	   	try {
			con = db.getConnection();
			PreparedStatement ps = con.prepareStatement("select * from appointments where user_id=?");
			 ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				AppointmentModel am = new AppointmentModel();
				am. setAppointmentId(rs.getInt("appointment_id"));
				am.setDoctorId(rs.getInt("doctor_id"));
				am. setAppointmentDate(rs.getString("appointment_date"));
				am.setAppointmentTime(rs.getString("appointment_time"));
				am.setStatus(rs.getString("status"));
				DoctorModel dm = getDoctorById(am.getDoctorId());	
				if(dm!=null) {
				am.setDoctorName(dm.getDoctorName());
				am.setSpecialization(dm.getSpecialization());
				}
				list.add(am);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	@Override
	public List<AppointmentModel> getAppointmentByDoctorId(int doctorId) {
		  List<AppointmentModel> list = new ArrayList<>();

		    try {
		        con = db.getConnection();

		        PreparedStatement ps = con.prepareStatement(
		            "select * from appointments where doctor_id=?"
		        );

		        ps.setInt(1, doctorId);

		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {

		            AppointmentModel am = new AppointmentModel();

		            am.setAppointmentId(
		                rs.getInt("appointment_id"));

		            am.setUserId(
		                rs.getInt("user_id"));

		            am.setDoctorId(
		                rs.getInt("doctor_id"));

		            am.setAppointmentDate(
		                rs.getString("appointment_date"));

		            am.setAppointmentTime(
		                rs.getString("appointment_time"));

		            am.setStatus(
		                rs.getString("status"));
		            DoctorModel dm = getDoctorById(am.getDoctorId());
		            if(dm!=null) {
						am.setDoctorName(dm.getDoctorName());
						am.setSpecialization(dm.getSpecialization());
						}
		            list.add(am);
		        }

		    } catch (Exception e) {
		        System.out.println(e);
		    }

		    return list;
	}
	@Override
	public String updateAppointmentStatus(int appointmentId, String status) {

	    try {
	        con = db.getConnection();

	        PreparedStatement ps = con.prepareStatement(
	            "update appointments set status=? where appointment_id=?"
	        );

	        ps.setString(1, status);
	        ps.setInt(2, appointmentId);

	        int n = ps.executeUpdate();

	        if (n > 0) {
	            return "success";
	        }

	    } catch (Exception e) {
	        System.out.println(e);
	    }

	    return "fail";
	}
	@Override
	public DoctorModel getDoctorByEmail(String email) {

	    DoctorModel dm = null;

	    try {
	        con = db.getConnection();

	        PreparedStatement ps = con.prepareStatement(
	            "select * from doctors where email=?"
	        );

	        ps.setString(1, email);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {

	            dm = new DoctorModel();

	            dm.setDoctorId(rs.getInt("doctor_id"));
	            dm.setDoctorName(rs.getString("doctor_name"));
	            dm.setSpecialization(rs.getString("specalization"));
	            dm.setEmail(rs.getString("email"));
	            dm.setPhone(rs.getString("phone"));
	        }

	    } catch (Exception e) {
	        System.out.println(e);
	    }

	    return dm;
	}

	@Override
	public List<AppointmentModel> getAllAppointments() {
		List<AppointmentModel> list = new ArrayList<>();
		try {
			con=db.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from appointments");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				AppointmentModel am=new AppointmentModel();
				am.setAppointmentId(rs.getInt("appointment_id"));
				am.setUserId(rs.getInt("user_id"));
				am.setDoctorId(rs.getInt("doctor_id"));
				am.setAppointmentDate(rs.getString("appointment_date"));
				am.setAppointmentTime(rs.getString("appointment_time"));
				am.setStatus(rs.getString("status"));
				  DoctorModel dm = getDoctorById(am.getDoctorId());
		            if(dm!=null) {
						am.setDoctorName(dm.getDoctorName());
						am.setSpecialization(dm.getSpecialization());
						}
				list.add(am);
			}
		}catch(Exception e){
			System.out.println(e);
		}
		return list;
	}

	@Override
	public List<UserModel> getAllPatients() {
		List<UserModel> list = new ArrayList<>();
		try {
			con=db.getConnection();
			PreparedStatement ps=con.prepareStatement("select * from users where role=?");
			ps.setString(1, "patient");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				UserModel um=new UserModel();
				um.setUserId(rs.getInt("user_id"));
				um.setName(rs.getString("name"));
				um.setEmail(rs.getString("email"));
				um.setRole(rs.getString("role"));
				list.add(um);
						}	
		}catch(Exception e){
			System.out.println(e);
		}
		return list;
	}

}
