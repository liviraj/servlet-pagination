package com.servletpagination.servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.serveletpagination.dao.StudentDAO;
import com.serveletpagination.dao.StudentService;
import com.serveletpagination.dao.StudentDAO;
import com.servletpagination.model.StudentReg;

@WebServlet("/StudentController")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String REGISTER_PAGE = "RegisterStudent.jsp";
	private static final String VIEW_PAGE = "displayStudent.jsp";
	private static final String LOGIN = "login.jsp";
	RequestDispatcher requestDispatcher = null;

	public StudentController() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String check = (String) session.getAttribute("username");
		String action = request.getParameter("action");
		String navigation = "";
		if (action.equals("register")) {
			if (check != null) {
				request.setAttribute("name", "save");
				navigation = REGISTER_PAGE;
			} else {
				requestDispatcher = request.getRequestDispatcher(LOGIN);
			}
		} else if (action.equals("cancel")) {
			navigation = "home.jsp";
		} else if (action.equals("update")) {
			if (check != null) {
				StudentService service = new StudentService();
				StudentReg model = new StudentReg();
				int id = Integer.parseInt(request.getParameter("regId"));
				try {
					model = service.getById(id);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				request.setAttribute("name", "update");
				request.setAttribute("details", model);
				navigation = REGISTER_PAGE;
			} else {
				requestDispatcher = request.getRequestDispatcher(LOGIN);
			}
		} else if (action.equals("delete")) {
			String confirm = request.getParameter("confirm");
			if (check != null) {
				if (!"false".equals(confirm)) {
					StudentDAO serviceDAO = new StudentDAO();
					StudentService service = new StudentService();
					int id = Integer.parseInt(request.getParameter("regId"));
					try {
						int reult = service.deleteById(id);
						if (reult == 1) {
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
							navigation = VIEW_PAGE;
						}
					} catch (ClassNotFoundException e) {
						e.printStackTrace();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				} else {
					requestDispatcher = request.getRequestDispatcher(LOGIN);
				}
			}
		} else if (action.equals("add")) {
			if (check != null) {
				request.setAttribute("name", "save");
				navigation = REGISTER_PAGE;
			} else {
				requestDispatcher = request.getRequestDispatcher(LOGIN);
			}
		} else {
			if (check != null) {
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
				navigation = VIEW_PAGE;
			} else {
				requestDispatcher = request.getRequestDispatcher(LOGIN);
			}
		}
		requestDispatcher = request.getRequestDispatcher(navigation);
		requestDispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String check = (String) session.getAttribute("username");
		String action = request.getParameter("submit");
		ArrayList<StudentReg> arrayList = new ArrayList<StudentReg>();
		if (action.equals("save")) {
			if (check != null) {
				StudentReg model = new StudentReg();
				StudentService serviceSec = new StudentService();
				String studentName = request.getParameter("name");
				String mobileNo = request.getParameter("mobileNo");
				String emailId = request.getParameter("emailId");
				String gender = request.getParameter("gender");

				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date dobReq = null;
				try {
					String reqDate = request.getParameter("dob");
					dobReq = dateFormat.parse(reqDate);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Date dobDate = new Date(dobReq.getTime());

				String address = request.getParameter("address");

				String department = request.getParameter("department");

				model.setName(studentName);
				model.setMobileNo(mobileNo);
				model.setEmailId(emailId);
				model.setGender(gender);
				model.setDob(dobDate);
				model.setAddress(address);
				model.setDepartment(department);

				String result = serviceSec.check(emailId);
				arrayList.add(model);
				if (result.equals("success")) {
					request.setAttribute("name", "save");
					request.setAttribute("msg", "Email id Already Exist");
					request.setAttribute("details", model);
					requestDispatcher = request.getRequestDispatcher(REGISTER_PAGE);
				} else {
					int status = serviceSec.insertDetails(model);
					if (status > 0) {
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
						requestDispatcher = request.getRequestDispatcher(VIEW_PAGE);
					}
				}
			} else {
				requestDispatcher = request.getRequestDispatcher(LOGIN);
			}
		} else if (action.equals("Cancel")) {
			if (check != null) {
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
				requestDispatcher = request.getRequestDispatcher(VIEW_PAGE);
			} else {
				requestDispatcher = request.getRequestDispatcher(LOGIN);
			}
		} else {
			if (check != null) {
				StudentReg model = new StudentReg();
				StudentService service = new StudentService();

				int id = Integer.parseInt(request.getParameter("regId"));
				String studentName = request.getParameter("name");
				String mobileNo = request.getParameter("mobileNo");
				String emailId = request.getParameter("emailId");
				String gender = request.getParameter("gender");

				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				java.util.Date dobReq = null;
				try {
					String reqDate = request.getParameter("dob");
					dobReq = dateFormat.parse(reqDate);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				Date dobDate = new Date(dobReq.getTime());

				String address = request.getParameter("address");

				String department = request.getParameter("department");
				
				model.setRegId(id);
				model.setName(studentName);
				model.setMobileNo(mobileNo);
				model.setEmailId(emailId);
				model.setGender(gender);
				model.setDob(dobDate);
				model.setAddress(address);
				model.setDepartment(department);
				try {
					int status = service.update(model);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
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
				request.setAttribute("msg", "record updated successfully");
				requestDispatcher = request.getRequestDispatcher(VIEW_PAGE);
			} else {
				requestDispatcher = request.getRequestDispatcher(LOGIN);
			}
		}
		requestDispatcher.forward(request, response);
	}
}
