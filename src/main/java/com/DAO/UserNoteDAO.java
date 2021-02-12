package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.DBConnection.DBConnection;
import com.notes.Note;
import com.notes.NoteDetail;

public class UserNoteDAO {

	
	private static Connection connection=null;
	
	public UserNoteDAO() {
		connection= DBConnection.getConnection();
	}
	
	
	public  ArrayList<NoteDetail> allNotes() {
        NoteDetail noteDetail= null;
		ArrayList<NoteDetail> noteDetailArrayList= new ArrayList<NoteDetail>();
        try {
        	String sql="SELECT notes.id AS noteID, notes.title,notes.content,notes.added, users.username,users.email,users.id AS userID FROM notes  INNER JOIN users ON notes.userid= users.id ";

			PreparedStatement stmt= connection.prepareStatement(sql);
			ResultSet rSet= stmt.executeQuery();
			
			 while ( rSet .next()   ) {
				  noteDetail= new NoteDetail();
				  noteDetail.setNoteId(  rSet.getInt("noteID") );
				  noteDetail.setTitle(  rSet.getString("title") );
				  noteDetail.setContent(  rSet.getString("content") );
				  noteDetail.setEmail(  rSet.getString("email") );
				  noteDetail.setContent(  rSet.getString("content") );
				  noteDetail.setUsername(  rSet.getString("username") );
				  noteDetail.setUserId(  rSet.getInt("userID") );
				  noteDetail.setDate(  rSet.getString("added") );
				  noteDetailArrayList.add(noteDetail);

			}
			 
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
		return noteDetailArrayList;
	}
	
	public boolean addnote(Note note) {
		boolean isSaved=false;
		try {
			String sql="insert into notes(title,content,userid) values(?,?,?)";
			PreparedStatement statement= connection.prepareStatement(sql);
			statement.setString(1, note.getTitle());
			statement.setString(2, note.getContent());
			statement.setInt(3, note.getUserid());
			statement.execute();
			isSaved=true;
		} catch (Exception e) {
		System.err.println(e.getMessage());
		}
		
		
		return isSaved;
	}
	
	
	
	public boolean deleteNote(int deleteid) {
		boolean isDelete=false;
		try {
			String sql="DELETE   FROM notes WHERE notes.id = ?";
			PreparedStatement statement=  connection.prepareStatement(sql);
			statement.setInt(1, deleteid);
			statement.execute();
			isDelete=true;
			
		} catch (Exception e) {
			System.out.println(e.getMessage() );
		}
		return isDelete;
	}
	
	
	
	public int countUserNote(int userid) {
		int count=0;
		try {
			String sql="SELECT COUNT(id)  AS noteCount FROM notes WHERE notes.`userid`=?";
			PreparedStatement stmt= connection.prepareStatement(sql);
			stmt.setInt(1, userid);
			ResultSet rset= stmt.executeQuery();
			while ( rset.next()  ) {
				count= rset.getInt("noteCount");
			}
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return  count;
	}
	
	
	
	
	public ArrayList<NoteDetail> getNotesOfLoggedInUser(int userid) {
		
		NoteDetail noteDetail;
		ArrayList<NoteDetail> noteDetailArrayList= new ArrayList<NoteDetail>();
		
		try {
			
			String sql="SELECT * FROM notes  WHERE notes.`userid`=?";

			PreparedStatement stmt= connection.prepareStatement(sql);
			stmt.setInt(1, userid);
			ResultSet rSet= stmt.executeQuery();
			
			while (rSet.next()) {
            	noteDetail= new NoteDetail();
            	noteDetail.setTitle(  rSet.getString("title") );
            	noteDetail.setContent(  rSet.getString("content") );
            	noteDetail.setNoteId(  rSet.getInt("id") );
            	noteDetail.setUserId(  rSet.getInt("userid") );
            	noteDetail.setDate(  rSet.getString("added") );
            	
               noteDetailArrayList.add(noteDetail);
          
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
		return  noteDetailArrayList;
	}






}
