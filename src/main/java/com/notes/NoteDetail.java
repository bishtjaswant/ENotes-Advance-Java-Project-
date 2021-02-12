package com.notes;



public class NoteDetail {

	private int noteId = 0;
	private int userId = 0;
	private String title = null;
	private String content = null;
	private String username = null;
	private String email = null;
	private String date= null;

	public NoteDetail() {
	}

	public NoteDetail(int noteId, int userId, String title, String content, String username, String email) {
		super();
		this.noteId = noteId;
		this.userId = userId;
		this.title = title;
		this.content = content;
		this.username = username;
		this.email = email;
	}

	public int getNoteId() {
		return noteId;
	}

	public void setNoteId(int noteId) {
		this.noteId = noteId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	
	
    public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "NoteDetail [noteId=" + noteId + ", userId=" + userId + ", title=" + title + ", content=" + content
				+ ", username=" + username + ", email=" + email + "]";
	}

	 
}
