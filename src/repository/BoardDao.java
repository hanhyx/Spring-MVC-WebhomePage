package repository;
 
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
 
import repository.mapper.BoardMapper;
import vo.BoardVO;
 
@Component
public class BoardDao {
    @Autowired
    private SqlSessionTemplate session;
///////////////////////////////////////////////////
    public int insert(BoardVO board) {
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.insert(board);
    }
     
    public int selectCount() {
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.selectTotalCount();
    }
    
    public int selectSearchedCount(int boardCategory, String keyword) {
    	BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.selectSearchedCount(boardCategory, keyword);
    }
    
    public int selectCategoryCount(int boardCategory) {
    	BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.selectCategoryCount(boardCategory);
    }
     
    public BoardVO select(int boardNum) {
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.select(boardNum);
    }
     
    public List<BoardVO> selectList(int startRow, int count){
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.selectList(startRow, count);
    }
    
    public List<BoardVO> selectSearchedList(int boardCategory, String keyword, int startRow, int count){
    	BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.selectSearchedList(boardCategory, keyword, startRow, count);
    }
    
    public List<BoardVO> selectCategoryList(int boardCategory, int startRow, int count){
    	BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.selectCategoryList(boardCategory, startRow, count);
    }
     
    public int updateReadCount(int boardNum) {
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.updateReadCount(boardNum);
    }
     
    public int update(BoardVO board) {
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.update(board);
    }
     
    public int delete(int boardNum) {
        BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.delete(boardNum);
    }
    
    public List<BoardVO> bestPicList(){
    	BoardMapper mapper = 
                session.getMapper(BoardMapper.class);
        return mapper.bestPicList();
    }
    
}