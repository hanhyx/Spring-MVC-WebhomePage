package vo;
 
import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;
 
public class BoardVO {
	private List<PictureVO> downPic;
	private List<MultipartFile> upPic;
	private PictureVO mainPic;
	private List<ReplyVO> reply;
	private int replyCount;
    private int boardNum;
    private String title;
    private String writer;
    private String content;
    private int readCount;
    private Date writeDate;
    private int boardCategory;
    
	public BoardVO(List<PictureVO> downPic, List<MultipartFile> upPic, int boardNum, String title, String writer,
			String content, int readCount, Date writeDate, int boardCategory) {
		this.downPic = downPic;
		this.upPic = upPic;
		this.boardNum = boardNum;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.readCount = readCount;
		this.writeDate = writeDate;
		this.boardCategory = boardCategory;
	}
	
	public BoardVO(int boardNum, String title, String writer,
			String content, int readCount, Date writeDate, int boardCategory) {
		this.boardNum = boardNum;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.readCount = readCount;
		this.writeDate = writeDate;
		this.boardCategory = boardCategory;
	}
    
	public BoardVO() {}
	
	public int getReplyCount() {
		return replyCount;
	}
	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	public List<ReplyVO> getReply() {
		return reply;
	}
	
	public void setReply(List<ReplyVO> reply) {
		this.reply = reply;
	}
	
	public PictureVO getMainPic() {
		return mainPic;
	}
	public void setMainPic(PictureVO mainPic) {
		this.mainPic = mainPic;
	}
	public List<PictureVO> getDownPic() {
		return downPic;
	}

	public void setDownPic(List<PictureVO> downPic) {
		this.downPic = downPic;
	}

	public List<MultipartFile> getUpPic() {
		return upPic;
	}

	public void setUpPic(List<MultipartFile> upPic) {
		this.upPic = upPic;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	
	public int getBoardCategory() {
		return boardCategory;
	}
	
	public void setBoardCategory(int boardCategory) {
		this.boardCategory = boardCategory;
	}

	@Override
	public String toString() {
		return "BoardVO [downPic=" + downPic + ", upPic=" + upPic + ", mainPic=" + mainPic + ", reply=" + reply
				+ ", replyCount=" + replyCount + ", boardNum=" + boardNum + ", title=" + title + ", writer=" + writer
				+ ", content=" + content + ", readCount=" + readCount + ", writeDate=" + writeDate + ", boardCategory="
				+ boardCategory + "]";
	}

	
	
    
}