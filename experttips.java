package eliving.servlets;

import java.io.IOException;

import eliving.dbtasks.CrudOperation;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class experttips
 */
@WebServlet("/experttips")
public class experttips extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement psinbox;
	private PreparedStatement pssent;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public experttips() {
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
		
		String msg=request.getParameter("tip");
		
		HttpSession hs=request.getSession(false);
		String studentid=(String)hs.getAttribute("sessionkey");
		
		
		con=CrudOperation.createConnection();
		try {
			con.setAutoCommit(false);
			String strinsert="insert into tips(userid,Date,Tips) values(?,?,?)";
			pssent=con.prepareStatement(strinsert);
			pssent.setString(1, studentid);
			pssent.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
			pssent.setString(3, msg);
			int row1=pssent.executeUpdate();
			
			
			
			if(row1>0) {
				con.commit();
				
				response.sendRedirect("/E-Living_Mantras/Dietician/DietYogahome.jsp");
			}
			else {
				System.out.println("failed");
			}
			
		}
		catch(SQLException se) {
			System.out.println(se);
			
		} 
	}
}

