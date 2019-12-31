package eliving.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import eliving.dbtasks.CrudOperation;
import java.sql.*;
/**
 * Servlet implementation class usercompose
 */
@WebServlet("/usercompose")
public class usercompose extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Connection con;
	private PreparedStatement psinbox;
	private PreparedStatement pssent;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public usercompose() {
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
		String sub=request.getParameter("sub");
		String msg=request.getParameter("message");
		HttpSession hs=request.getSession(false);
		String senderid=(String)hs.getAttribute("sessionkey");
		
		
		
		con=CrudOperation.createConnection();
		try {
			String sql1="select * from logindetails where Userid=?";
			ResultSet rsdata=CrudOperation.getData(sql1,id);
			
			if(rsdata.next()) {
			con.setAutoCommit(false);
			String strinsert="insert into sentitem(Senderid,Receiverid,Subject,Message,Dateofmsg) values(?,?,?,?,?)";
			pssent=con.prepareStatement(strinsert);
			pssent.setString(1, senderid);
			pssent.setString(2, id);
			pssent.setString(3, sub);
			pssent.setString(4, msg);
			pssent.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			int row1=pssent.executeUpdate();
			
			
			String sql="insert into inbox(Senderid,Receiverid,Subject,Message,Dateofmsg) values(?,?,?,?,?)";
			psinbox=con.prepareStatement(sql);// pass the query to DBMS and DBMS will compile the query and store in buffer
			psinbox.setString(1, senderid);
			psinbox.setString(2, id);
			psinbox.setString(3, sub);
			psinbox.setString(4, msg);
			psinbox.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			
			
			int rw=psinbox.executeUpdate();// it is used to fire insert update delete query
			if(rw>0 && row1>0) {
				con.commit();
				
				response.sendRedirect("/E-Living_Mantras/jsp/usersentmsg.jsp");
			}
			else {
				System.out.println("failed");
			}
			}
			else {
				String message="User Id Is Wrong";
				request.setAttribute("msg3",message);
				RequestDispatcher rd=request.getRequestDispatcher("/jsp/usercompose.jsp"); 
				rd.forward(request, response);
			}
			}
		
		catch(SQLException se) {
			System.out.println(se);
			
		}
		
		
	}

}
