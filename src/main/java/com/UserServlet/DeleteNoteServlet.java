package com.UserServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserNoteDAO;

public class DeleteNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		int deleteNoteId= Integer.parseInt(  request.getParameter("deleteID" ) );
		UserNoteDAO noteDAO= new UserNoteDAO();
		
		HttpSession session;
		
		if (noteDAO.deleteNote(deleteNoteId)) {
 		    session= request.getSession();
 		    session.setAttribute("note-msg", "note have been deleted");
 		    response.sendRedirect("mynotes.jsp");
		} else {
			 session= request.getSession();
	 		    session.setAttribute("note-msg", "note not deleted");
	 		    response.sendRedirect("mynotes.jsp");
		}
	}

}
