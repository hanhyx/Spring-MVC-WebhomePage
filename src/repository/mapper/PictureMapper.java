package repository.mapper;

import java.util.List;

import vo.PictureVO;

public interface PictureMapper {
	public int insertPic(PictureVO picture);
    public List<PictureVO> selectListPic(int boardNum);
//    public int minNumPic(int boardNum);
    public PictureVO selectPic(int pictureNum);
    public int delete(int boardNum);

}
