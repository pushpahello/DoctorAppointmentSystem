package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class homepageController
 */
public class homepageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public homepageController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		String btn=request.getParameter("button");
		if(btn.equals("Get Started")) {
		
		//navigate to another page
		RequestDispatcher rd=request.getRequestDispatcher("/view/login_input.jsp");
		rd.forward(request, response);
		}
		else if(btn.equals("Sign Up")) {
			
			//navigate to another page
			RequestDispatcher rd=request.getRequestDispatcher("/view/signup.jsp");
			rd.forward(request, response);
			}
		if(btn.equals("Join Now")) {
			
			//navigate to another page
			RequestDispatcher rd=request.getRequestDispatcher("/view/login_input.jsp");
			rd.forward(request, response);
			}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
