package repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.mapper.PictureMapper;
import vo.BoardVO;
import vo.PictureVO;

@Component
public class PictureDao {
	@Autowired
	private SqlSessionTemplate session;

	public int insertPic(PictureVO picture) {
		PictureMapper mapper = session.getMapper(PictureMapper.class);
		return mapper.insertPic(picture);
	}

	public List<PictureVO> selectListPic(int boardNum) {
		PictureMapper mapper = session.getMapper(PictureMapper.class);
		return mapper.selectListPic(boardNum);
	}
	
//	public int minNumPic(int boardNum) {
//		PictureMapper mapper = session.getMapper(PictureMapper.class);
//		return mapper.minNumPic(boardNum);
//	}
	
	public PictureVO selectPic(int pictureNum) {
		PictureMapper mapper = session.getMapper(PictureMapper.class);
		return mapper.selectPic(pictureNum);
	}
	
	public int delete(int boardNum) {
		PictureMapper mapper = session.getMapper(PictureMapper.class);
		return mapper.delete(boardNum);
	}

}
