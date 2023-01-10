package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Patient;

import java.io.IOException;
import java.io.PrintWriter;

import dao.MainDAO;

/**
 * Servlet implementation class RegisterController
 */
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MainDAO mainDao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		mainDao = new MainDAO();
		PrintWriter out=response.getWriter();
		String p_Fname=request.getParameter("txtFname");
		String p_Lname=request.getParameter("txtLname");
		char p_gender=request.getParameter("gender").charAt(0);
		String p_email=request.getParameter("txtEmail");
		String p_phoneNo=request.getParameter("txtPhone");
		String p_age=request.getParameter("txtAge");
		String p_address=request.getParameter("txtAddress");
		String p_username=request.getParameter("txtUsername");
		String p_password=request.getParameter("txtPassword");

		Patient patient= new Patient(p_Fname, p_Lname, p_gender, p_email,p_age, p_phoneNo, p_address, p_username, p_password);
		try {
			int insert=mainDao.registerpatientPrepaedStatement(patient);
			if(insert==1) {
				RequestDispatcher rd = request.getRequestDispatcher("/view/login_input.jsp");
                rd.forward(request, response);
				
			} else {
				out.print("ERROR registering customer");
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
