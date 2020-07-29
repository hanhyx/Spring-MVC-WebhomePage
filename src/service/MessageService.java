package service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.MessageRDao;
import repository.MessageSDao;
import vo.MessagePageVO;
import vo.MessageVO;

@Component
public class MessageService {
	@Autowired
	private MessageSDao mesSDao;
	@Autowired
	private MessageRDao mesRDao;

	private static final int MESSAGE_COUNT_PER_PAGE = 10;

	public MessagePageVO makeMessageReceiverPage(int currentPage, String receiver) {
		int totalCount = mesSDao.selectReceiveCount(receiver);

		int totalPage = totalCount / MESSAGE_COUNT_PER_PAGE;
		if (totalCount % MESSAGE_COUNT_PER_PAGE != 0) {
			totalPage++;
		}

		int startPage = (currentPage - 1) / 10 * 10 + 1;

		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		int startRow = (currentPage - 1) * MESSAGE_COUNT_PER_PAGE;

		List<MessageVO> messageList = mesSDao.selectReceiveList(receiver, startRow, MESSAGE_COUNT_PER_PAGE);

		for (MessageVO m : messageList) {
			String contents = m.getContent();
			contents = contents.replace("\r\n", "<br>");
			contents = contents.replace("\n", "<br>");
			contents = contents.replace("\r", "<br>");
			m.setContent(contents);
		}

		return new MessagePageVO(messageList, currentPage, startPage, endPage, totalPage);
	}

	public MessagePageVO makeMessageSenderPage(int currentPage, String sender) {
		int totalCount = mesRDao.selectSendCount(sender);

		int totalPage = totalCount / MESSAGE_COUNT_PER_PAGE;
		if (totalCount % MESSAGE_COUNT_PER_PAGE != 0) {
			totalPage++;
		}

		int startPage = (currentPage - 1) / 10 * 10 + 1;

		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		int startRow = (currentPage - 1) * MESSAGE_COUNT_PER_PAGE;

		List<MessageVO> messageList = mesRDao.selectSendList(sender, startRow, MESSAGE_COUNT_PER_PAGE);

		for (MessageVO m : messageList) {
			String contents = m.getContent();
			contents = contents.replace("\r\n", "<br>");
			contents = contents.replace("\n", "<br>");
			contents = contents.replace("\r", "<br>");
			m.setContent(contents);
		}

		return new MessagePageVO(messageList, currentPage, startPage, endPage, totalPage);
	}

	public void write(MessageVO message, String loginId) {
		message.setWriteDate(new Date());
		message.setSender(loginId);
		mesSDao.insertSender(message);
		mesRDao.insertReceiver(message);
	}

	public MessageVO readSender(int message_num) {
		MessageVO message = mesSDao.selectSender(message_num);

		String contents = message.getContent();
		contents = contents.replace("\r\n", "<br>");
		contents = contents.replace("\n", "<br>");
		contents = contents.replace("\r", "<br>");
		message.setContent(contents);
		
		return message;
	}

	public MessageVO readReceiver(int message_num, String loginId) {
		MessageVO message = mesRDao.selectReceiver(message_num);

		String contents = message.getContent();
		contents = contents.replace("\r\n", "<br>");
		contents = contents.replace("\n", "<br>");
		contents = contents.replace("\r", "<br>");
		message.setContent(contents);
		
		message.setChecked(1);
		mesRDao.updateReceiver(message);
		
		return message;
	}

	public boolean deleteSender(int message_num, String loginId) {
		MessageVO message = mesRDao.selectReceiver(message_num);

		if (loginId != null && loginId.equals(message.getSender())) {
			mesRDao.deleteReceiver(message_num);
			return true;
		} else {
			return false;
		}
	}

	public boolean deleteReceiver(int message_num, String loginId) {
		MessageVO message = mesSDao.selectSender(message_num);

		if (loginId != null && loginId.equals(message.getReceiver())) {
			mesSDao.deleteSender(message_num);
			return true;
		} else {
			return false;
		}
	}

}
