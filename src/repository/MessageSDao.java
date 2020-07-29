package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.MessageSMapper;
import vo.MessageVO;

@Component
public class MessageSDao {
	@Autowired
	private SqlSessionTemplate session;

	public int insertSender(MessageVO message) {
		MessageSMapper mapper = session.getMapper(MessageSMapper.class);
		return mapper.insertSender(message);
	}

	public int selectReceiveCount(String receiver) {
		MessageSMapper mapper = session.getMapper(MessageSMapper.class);
		return mapper.selectReceiveCount(receiver);
	}

	public int selectSendCount(String sender) {
		MessageSMapper mapper = session.getMapper(MessageSMapper.class);
		return mapper.selectSendCount(sender);
	}

	public MessageVO selectSender(int message_num) {
		MessageSMapper mapper = session.getMapper(MessageSMapper.class);
		return mapper.selectSender(message_num);
	}

	public List<MessageVO> selectReceiveList(String receiver, int startRow, int count) {
		MessageSMapper mapper = session.getMapper(MessageSMapper.class);
		return mapper.selectReceiveList(receiver, startRow, count);
	}

	public List<MessageVO> selectSendList(String sender, int startRow, int count) {
		MessageSMapper mapper = session.getMapper(MessageSMapper.class);
		return mapper.selectSendList(sender, startRow, count);
	}

	public int deleteSender(int message_num) {
		MessageSMapper mapper = session.getMapper(MessageSMapper.class);
		return mapper.deleteSender(message_num);
	}

}
