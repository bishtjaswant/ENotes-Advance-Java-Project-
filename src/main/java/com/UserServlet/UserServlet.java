package com.UserServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.User.User;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	 

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String firstname= request.getParameter("firstname");
		String lastname= request.getParameter("lastname");
		String email = request.getParameter("email");
		String username= request.getParameter("username");
		String password= request.getParameter("password");
		
		
		User user= new User(firstname,lastname,username,email,password);
	
		UserDAO userDAO= new UserDAO();
		HttpSession session;
		
		 if ( 		 userDAO.addUser(user)    ) {
			session= request.getSession();
			session.setAttribute("regis-success", "registration successfull");
			response.sendRedirect("register.jsp");
		}
		else {
			session= request.getSession();
			session.setAttribute("regis-failed", "registration failed. please try again after sometime");
			response.sendRedirect("register.jsp");
		}
		
	}

}
