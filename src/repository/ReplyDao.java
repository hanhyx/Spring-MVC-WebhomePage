package repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.ReplyMapper;
import vo.ReplyVO;

@Component
public class ReplyDao {
	@Autowired
    private SqlSessionTemplate session;
	
	public int insert(ReplyVO reply) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.insert(reply);
	}
	public int afterInsert(int replyNum) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.afterInsert(replyNum);
	}
	public int update(ReplyVO reply) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.update(reply);
	}
	public int delete(int replyNum) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.delete(replyNum);
	}
	public int deleteAll(int boardNum) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.deleteAll(boardNum);
	}
	public ReplyVO select(int replyNum) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.select(replyNum);
	}
	public int selectBoardNum(int replyNum) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.selectBoardNum(replyNum);
	}
	public List<ReplyVO> selectList(int boardNum, int startRow, int count){
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.selectList(boardNum, startRow, count);
	}
	public List<ReplyVO> selectGroupNum(int grp){
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.selectGroupNum(grp);
	}
	
//	public List<ReplyVO> selectListRep(int boardNum){
//		ReplyMapper mapper = 
//                session.getMapper(ReplyMapper.class);
//        return mapper.selectListRep(boardNum);
//	}
	public int totalCount(int boardNum) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.totalCount(boardNum);
	}
	public int maxSeq(int grp) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.maxSeq(grp);
	}
	public int updateSeq(int grp, int insertedSeq) {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.updateSeq(grp, insertedSeq);
	}
	public int maxNum() {
		ReplyMapper mapper = 
                session.getMapper(ReplyMapper.class);
        return mapper.maxNum();
	}

}
