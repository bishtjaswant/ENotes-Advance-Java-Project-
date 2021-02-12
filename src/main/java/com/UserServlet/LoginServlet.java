package com.UserServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.User.User;
 
public class LoginServlet extends HttpServlet {
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email= request.getParameter("email");
		String pwd= request.getParameter("password");
		
		User user= new User();
		user.setEmail(email);
		user.setPassword(pwd);
		
		
		UserDAO userDAO= new UserDAO();
	     
		User userdetails= userDAO.loginUser(user);
		
		if ( userdetails != null ) {
			
			HttpSession session= request.getSession();
			session.setAttribute("userdetails", userdetails);
			response.sendRedirect("home.jsp");
			
			
		} else {
             HttpSession session= request.getSession();
				session.setAttribute("login-err", "Invalid Email Address Or Password");
             response.sendRedirect("login.jsp");
		}
		
	}

}
