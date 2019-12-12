package kr.co.domain;

public class boardVO {
	private int bnum;
	private String title;
	private String writer;
	private int readcnt;
	private String writedate;
	private String content;
	
	private int rnum;  //replyVO
	
	public boardVO() {
		// TODO Auto-generated constructor stub
	}

	public boardVO(int bnum, String title, String writer, int readcnt, String writedate, String content, int rnum) {
		super();
		this.bnum = bnum;
		this.title = title;
		this.writer = writer;
		this.readcnt = readcnt;
		this.writedate = writedate;
		this.content = content;
		this.rnum = rnum;
	}

	public int getBnum() {
		return bnum;
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public String getWritedate() {
		return writedate;
	}

	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bnum;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		boardVO other = (boardVO) obj;
		if (bnum != other.bnum)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "boardVO [bnum=" + bnum + ", title=" + title + ", writer=" + writer + ", readcnt=" + readcnt
				+ ", writedate=" + writedate + ", content=" + content + ", rnum=" + rnum + "]";
	}

}
