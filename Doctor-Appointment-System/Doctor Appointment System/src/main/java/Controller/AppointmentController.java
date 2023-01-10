package Controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Appointment;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Time;

import dao.MainDAO;

/**
 * Servlet implementation class AppointmentController
 */
public class AppointmentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	MainDAO mainDao;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AppointmentController() {
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
		mainDao = new MainDAO();
		PrintWriter out=response.getWriter();
		int p_Id=Integer.parseInt(request.getParameter("id"));
		int d_Id=Integer.parseInt(request.getParameter("d_Id"));
		Date app_date=Date.valueOf(request.getParameter("app_date"));
		Time app_time=Time.valueOf(request.getParameter("app_time"));
		

		Appointment appointment= new Appointment(p_Id, d_Id, app_date,app_time);
		try {
			int insert=mainDao.appointmentPrepaedStatement(appointment);
			if(insert==1) {
				String message = "Appointment scheduled successfully.";
				out.println("<script type='text/javascript'>");
		        out.println("alert('" + message + "');");
		        out.println("</script>");
		        RequestDispatcher rd = request.getRequestDispatcher("/view/patientDash.jsp");
				rd.forward(request, response);
			} else {
				String message = "Error scheduling Appointment.";
				out.println("<script type='text/javascript'>");
		        out.println("alert('" + message + "');");
		        out.println("</script>");			}
		} catch(Exception ex) {
			ex.printStackTrace();
		
	}	}

}
