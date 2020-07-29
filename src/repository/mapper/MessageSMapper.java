package repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import vo.MessageVO;

public interface MessageSMapper {
	public int insertSender(MessageVO message);
    public int selectReceiveCount(String receiver);
    public int selectSendCount(String sender);
    public MessageVO selectSender(int message_num);
    public List<MessageVO> selectReceiveList
    (@Param("receiver")String receiver, @Param("startRow")int startRow, 
     @Param("count")int count);
    public List<MessageVO> selectSendList
    (@Param("sender")String sender, @Param("startRow")int startRow, 
     @Param("count")int count);
    public int deleteSender(int message_num);

}
