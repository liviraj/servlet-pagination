package com.servletpagination.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.serveletpagination.dao.StudentDAO;
import com.servletpagination.model.StudentReg;

public class StudentServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public StudentServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		int recordsPerPage = 5;
		if (request.getParameter("page") != null)
			page = Integer.parseInt(request.getParameter("page"));
		StudentDAO dao = new StudentDAO();
		List<StudentReg> list = dao.viewAllStudents((page - 1) * recordsPerPage, recordsPerPage);
		int noOfRecords = dao.getNoOfRecords();
		int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
		request.setAttribute("studentList", list);
		request.setAttribute("noOfPages", noOfPages);
		request.setAttribute("currentPage", page);
		RequestDispatcher view = request.getRequestDispatcher("displayStudent.jsp");
		view.forward(request, response);
	}
}
