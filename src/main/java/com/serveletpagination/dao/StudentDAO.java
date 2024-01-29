package com.serveletpagination.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.servletpagination.config.ConnectionFactory;
import com.servletpagination.model.StudentReg;

public class StudentDAO {
	Connection connection;
	Statement stmt;
	private int noOfRecords;

	public StudentDAO() {
	}

	private static Connection getConnection() throws SQLException, ClassNotFoundException {
		Connection con = ConnectionFactory.getInstance().getConnection();
		return con;
	}

	public List<StudentReg> viewAllStudents(int offset, int noOfRecords) {
		String query = "select SQL_CALC_FOUND_ROWS * from StudentReg limit " + offset + ", " + noOfRecords;
		List<StudentReg> list = new ArrayList<StudentReg>();
		StudentReg student = null;
		try {
			connection = getConnection();
			stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				student = new StudentReg();
				student.setRegId(rs.getInt("regId"));
				student.setName(rs.getString("name"));
				student.setMobileNo(rs.getString("mobileNo"));
				student.setEmailId(rs.getString("emailId"));
				student.setGender(rs.getString("gender"));
				student.setDob(rs.getDate("dob"));
				student.setAddress(rs.getString("address"));
				student.setDepartment(rs.getString("department"));

				list.add(student);
			}
			rs.close();

			rs = stmt.executeQuery("SELECT FOUND_ROWS()");
			if (rs.next())
				this.noOfRecords = rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (stmt != null)
					stmt.close();
				if (connection != null)
					connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	public int getNoOfRecords() {
		return noOfRecords;
	}
}
