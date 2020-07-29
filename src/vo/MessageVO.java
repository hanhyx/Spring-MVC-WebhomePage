package vo;

import java.util.Date;

public class MessageVO {
	private int message_num;
    private String sender;
    private String receiver;
    private String title;
    private String content;
    private Date writeDate;
    private int checked;
    
	public MessageVO(int message_num, String sender, String receiver, String title, String content, Date writeDate,
			int checked) {
		this.message_num = message_num;
		this.sender = sender;
		this.receiver = receiver;
		this.title = title;
		this.content = content;
		this.writeDate = writeDate;
		this.checked = checked;
	}
    
	public MessageVO() {}

	public int getMessage_num() {
		return message_num;
	}

	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
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

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	public int getChecked() {
		return checked;
	}

	public void setChecked(int checked) {
		this.checked = checked;
	}

	@Override
	public String toString() {
		return "MessageVO [message_num=" + message_num + ", sender=" + sender + ", receiver=" + receiver + ", title="
				+ title + ", content=" + content + ", writeDate=" + writeDate + ", checked=" + checked + "]";
	}
    
	
}
