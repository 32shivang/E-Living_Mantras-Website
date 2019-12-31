package eliving.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import eliving.dbtasks.CrudOperation;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
/**
 * Servlet implementation class userRegistrationServlet
 */
@WebServlet("/userRegistrationServlet")
public class userRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement psreg;
	private PreparedStatement pslogin;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userRegistrationServlet() {
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
		String id=request.getParameter("id");
		String password=request.getParameter("password");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String email=request.getParameter("email");
		String gender=request.getParameter("gender");
		String phone=request.getParameter("phone");
		String dor=new SimpleDateFormat("MM/dd/yyyy").format(Calendar.getInstance().getTime());
		String dob=request.getParameter("dob");
		//System.out.println(name+" , "+email+" , "+feedback);
		con=CrudOperation.createConnection();
		
		try {
			String sql1="select * from logindetails where Userid=?";
			ResultSet rsdata=CrudOperation.getData(sql1,id);
		
			if(rsdata.next()==false) {
				
			
			con.setAutoCommit(false);
			String strinsert="insert into logindetails values(?,?,?)";
			pslogin=con.prepareStatement(strinsert);
			pslogin.setString(1, id);
			pslogin.setString(2, password);
			pslogin.setString(3, "user");
			int row1=pslogin.executeUpdate();
			
			
			String sql="insert into userdetails values(?,?,?,?,?,?,?,?)";
			psreg=con.prepareStatement(sql);// pass the query to DBMS and DBMS will compile the query and store in buffer
			psreg.setString(1, id);
			psreg.setString(2, name);
			psreg.setString(3, address);
			psreg.setString(4, email);
			psreg.setString(5, gender);
			psreg.setString(6, phone);
			psreg.setTimestamp(7, new Timestamp(System.currentTimeMillis()));
			psreg.setString(8, dob);
			
			int rw=psreg.executeUpdate();// it is used to fire insert update delete query
			if(rw>0 && row1>0) {
				con.commit();
				System.out.println("inserted");
				response.sendRedirect("/E-Living_Mantras/Admin/adminhome.jsp");
			}
			else {
				System.out.println("failed");
			}
			
		}
		else {
			String message="User Id already exists";
			request.setAttribute("msg3",message);
			RequestDispatcher rd=request.getRequestDispatcher("/jsp/userreg.jsp"); 
			rd.forward(request, response);
		}
			}
		catch(SQLException se) {
			System.out.println(se);
			
		} 
	}

}
