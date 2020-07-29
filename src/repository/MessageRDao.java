package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.MessageRMapper;
import vo.MessageVO;

@Component
public class MessageRDao {
	@Autowired
	private SqlSessionTemplate session;

	public int insertReceiver(MessageVO message) {
		MessageRMapper mapper = session.getMapper(MessageRMapper.class);
		return mapper.insertReceiver(message);
	}

	public int selectReceiveCount(String receiver) {
		MessageRMapper mapper = session.getMapper(MessageRMapper.class);
		return mapper.selectReceiveCount(receiver);
	}

	public int selectSendCount(String sender) {
		MessageRMapper mapper = session.getMapper(MessageRMapper.class);
		return mapper.selectSendCount(sender);
	}

	public MessageVO selectReceiver(int message_num) {
		MessageRMapper mapper = session.getMapper(MessageRMapper.class);
		return mapper.selectReceiver(message_num);
	}

	public List<MessageVO> selectReceiveList(String receiver, int startRow, int count) {
		MessageRMapper mapper = session.getMapper(MessageRMapper.class);
		return mapper.selectReceiveList(receiver, startRow, count);
	}

	public List<MessageVO> selectSendList(String sender, int startRow, int count) {
		MessageRMapper mapper = session.getMapper(MessageRMapper.class);
		return mapper.selectSendList(sender, startRow, count);
	}
	
	public int updateReceiver(MessageVO message) {
		MessageRMapper mapper = session.getMapper(MessageRMapper.class);
		return mapper.updateReceiver(message);
	}

	public int deleteReceiver(int message_num) {
		MessageRMapper mapper = session.getMapper(MessageRMapper.class);
		return mapper.deleteReceiver(message_num);
	}

}
