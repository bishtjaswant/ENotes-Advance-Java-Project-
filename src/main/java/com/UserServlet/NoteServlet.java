package com.UserServlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserNoteDAO;
import com.notes.Note;


public class NoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String title=request.getParameter("title");
		String content=  request.getParameter("content");
		int userid= Integer.parseInt( request.getParameter("userid") );
		
		
		Note note= new  Note(userid,title, content);
		
		
		UserNoteDAO noteDAO= new UserNoteDAO();
		HttpSession session;
		if ( noteDAO.addnote(note )  ) {
			session= request.getSession();
			session.setAttribute("note-add", "note has been saved");
			response.sendRedirect("addnote.jsp");
			
			
		} else {
			session= request.getSession();
			session.setAttribute("note-failed", "note  not add. try again");
			response.sendRedirect("addnote.jsp");

		}
		
	
	}

}
