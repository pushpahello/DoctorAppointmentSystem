package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.*;

import database.DbConnection;

/**
 * Servlet implementation class loginController
 */
public class loginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DbConnection db;
	String fname="";
	String lname="";
	int id=0;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		response.getWriter().append("Served at: ").append(request.getContextPath());

		String btn = request.getParameter("button");
		
		

		if (btn.equals("LOGIN")) {
			

			String loginId = request.getParameter("loginID");
			String password = request.getParameter("loginPassword");

			String isLogin = login(loginId, password);
			HttpSession session=request.getSession();
			session.setAttribute("fname", fname);
			session.setAttribute("lname", lname);
			session.setAttribute("id", id);


			

			if (isLogin.equals("patient")) {
				RequestDispatcher rd = request.getRequestDispatcher("/view/patientDash.jsp");
				rd.forward(request, response);
			} else if (isLogin.equals("doctor")) {
				RequestDispatcher rd = request.getRequestDispatcher("/view/doctorDash.jsp");
				rd.forward(request, response);
			} else {
				request.setAttribute("status", "failed");
				// Call the same page and display error message
				RequestDispatcher rd = request.getRequestDispatcher("/view/login_input.jsp");
				rd.forward(request, response);
			}

		} else if (btn.equals("SIGN UP"))

		{

			// navigate to another page
			RequestDispatcher rd = request.getRequestDispatcher("/view/signup.jsp");
			rd.forward(request, response);
		}
	}

	private String login(String loginId, String password) {
		String result = "incorrect";
		db = new DbConnection();
		String query = "select * from patient where p_username=? or p_phoneNo=? or p_email=? and p_password=?;";
		try {
			PreparedStatement st = db.con.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_UPDATABLE);
			st.setString(1, loginId);
			st.setString(2, loginId);
			st.setString(3, loginId);
			st.setString(4, password);

			ResultSet rs = db.retrieve(st);
			rs.last();
			int row = rs.getRow();

			if (row > 0) {
				id=rs.getInt("p_Id");
				fname=rs.getString("p_Fname");
				lname=rs.getString("p_Lname");
				result = "patient";
			} else {
				query = "select * from doctor where d_username=? or d_email=? or d_phoneNo=? and d_password=?;";
				try {
					st = db.con.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
					st.setString(1, loginId);
					st.setString(2, loginId);
					st.setString(3, loginId);
					st.setString(4, password);

					rs = db.retrieve(st);
					rs.last();
					row = rs.getRow();
					if (row > 0) {
						result = "doctor";
						id=rs.getInt("d_Id");
						fname=rs.getString("d_Fname");
						lname=rs.getString("d_Lname");
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}

			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}
