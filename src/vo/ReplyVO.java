package vo;

public class ReplyVO {
	private int replyNum;
	private int boardNum;
    private String writer;
    private String content;
	private int grp;
	private int seq;
	private int lvl;
	private String profilePicPath;
	
	public ReplyVO(int replyNum, int boardNum, String writer, String content, int grp, int seq, int lvl) {
		this.replyNum = replyNum;
		this.boardNum = boardNum;
		this.writer = writer;
		this.content = content;
		this.grp = grp;
		this.seq = seq;
		this.lvl = lvl;
	}
	
	public ReplyVO() {}
	
	public String getProfilePicPath() {
		return profilePicPath;
	}
	public void setProfilePicPath(String profilePicPath) {
		this.profilePicPath = profilePicPath;
	}

	public int getReplyNum() {
		return replyNum;
	}

	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getGrp() {
		return grp;
	}

	public void setGrp(int grp) {
		this.grp = grp;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getLvl() {
		return lvl;
	}

	public void setLvl(int lvl) {
		this.lvl = lvl;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyNum=" + replyNum + ", boardNum=" + boardNum + ", writer=" + writer + ", content="
				+ content + ", grp=" + grp + ", seq=" + seq + ", lvl=" + lvl + "]";
	}
	
	
	
	
}
