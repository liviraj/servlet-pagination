package com.serveletpagination.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.servletpagination.config.ConnectionFactory;
import com.servletpagination.model.StudentReg;

public class StudentService {
	Connection con = null;
	Statement st = null;
	ResultSet rs = null;

	public StudentReg getById(int id) throws ClassNotFoundException {
		StudentReg model = new StudentReg();
		try {
			con = ConnectionFactory.getInstance().getConnection();
			PreparedStatement ps = (PreparedStatement) con
					.prepareStatement("select * from studentreg where regId='" + id + "'");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				model.setRegId(rs.getInt("regId"));
				model.setName(rs.getString("name"));
				model.setMobileNo(rs.getString("mobileNo"));
				model.setDob(rs.getDate("dob"));
				model.setEmailId(rs.getString("emailId"));
				model.setGender(rs.getString("gender"));
				model.setAddress(rs.getString("address"));
				model.setDepartment(rs.getString("department"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return model;
	}

	public int deleteById(int id) throws ClassNotFoundException, SQLException {
		int status = 0;
		String query = "delete from studentreg where regId=" + id + "";
		con = ConnectionFactory.getInstance().getConnection();
		PreparedStatement ps = (PreparedStatement) con.prepareStatement(query);
		status = ps.executeUpdate();
		return status;
	}

	public int insertDetails(StudentReg model) {
		int status = 0;
		try {
			con = ConnectionFactory.getInstance().getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"insert into studentreg(name,mobileNo,emailId,gender,dob,address,department) values(?,?,?,?,?,?,?)");
			ps.setString(1, model.getName());
			ps.setString(2, model.getMobileNo());
			ps.setString(3, model.getEmailId());
			ps.setString(4, model.getGender());
			ps.setDate(5, model.getDob());
			ps.setString(6, model.getAddress());
			ps.setString(7, model.getDepartment());

			status = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	public int update(StudentReg model) throws ClassNotFoundException {
		int status = 0;
		try {
			con = ConnectionFactory.getInstance().getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement(
					"update studentreg set name=?,mobileNo=?,emailId=?,gender=?,dob=?,address=?,department=?  where regId='"
							+ model.getRegId() + "'");
			ps.setString(1, model.getName());
			ps.setString(2, model.getMobileNo());
			ps.setString(3, model.getEmailId());
			ps.setString(4, model.getGender());
			ps.setDate(5, model.getDob());
			ps.setString(6, model.getAddress());
			ps.setString(7, model.getDepartment());

			status = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	public String check(String check) {
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = ConnectionFactory.getInstance().getConnection();
			st = (Statement) con.createStatement();
			rs = st.executeQuery("select emailId from employee where  emailId = '" + check + "'");
			if (rs.next()) {
				return "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "failed";
	}
}
