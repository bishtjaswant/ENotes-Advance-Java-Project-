package com.notes;

public class Note {

	private int id=0;
	private int userid=0;
	private String title=null;
	private String content=null;
	
	public Note() {
		// TODO Auto-generated constructor stub
	}

	
	public Note(int userid, String title, String content) {
		super();
		this.userid = userid;
		this.title = title;
		this.content = content;
	}


	public Note(int id, int userid, String title, String content) {
		super();
		this.id = id;
		this.userid = userid;
		this.title = title;
		this.content = content;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
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

	@Override
	public String toString() {
		return "Note [id=" + id + ", userid=" + userid + ", title=" + title + ", content=" + content + "]";
	}
	
	
	
}
