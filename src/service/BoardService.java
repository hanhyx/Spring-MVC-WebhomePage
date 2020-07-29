package service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import repository.BoardDao;
import repository.MemberDao;
import repository.PictureDao;
import repository.ReplyDao;
import vo.BoardPageVO;
import vo.BoardVO;
import vo.PictureVO;
import vo.ReplyPageVO;
import vo.ReplyVO;

@Component
public class BoardService {
	@Autowired
	private BoardDao dao;
	@Autowired
	private PictureDao picDao;
	@Autowired
	private ReplyDao repDao;
	@Autowired
	private MemberDao memDao;

	private static final int COUNT_PER_PAGE = 6;
	private static final int REPLY_COUNT_PER_PAGE = 8;

	public BoardPageVO makeBoardPage(int currentPage) {
		int totalCount = dao.selectCount();

		int totalPage = totalCount / COUNT_PER_PAGE;
		if (totalCount % COUNT_PER_PAGE != 0) {
			totalPage++;
		}

		int startPage = (currentPage - 1) / 10 * 10 + 1;

		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		int startRow = (currentPage - 1) * COUNT_PER_PAGE;

		List<BoardVO> boardList = dao.selectList(startRow, COUNT_PER_PAGE);

		for (BoardVO b : boardList) {
//			String contents = b.getContent();
//			contents = contents.replace("\r\n", "<br>");
//			contents = contents.replace("\n", "<br>");
//			contents = contents.replace("\r", "<br>");
//			b.setContent(contents);
			b.setMainPic(picDao.selectPic(b.getBoardNum()));
			b.setReplyCount(repDao.totalCount(b.getBoardNum()));
		}

		return new BoardPageVO(boardList, currentPage, startPage, endPage, totalPage);
	}
	
	public BoardPageVO makeSearchedPage(int currentPage, int boardCategory, String keyword) {
		int totalCount = dao.selectSearchedCount(boardCategory, keyword);

		int totalPage = totalCount / COUNT_PER_PAGE;
		if (totalCount % COUNT_PER_PAGE != 0) {
			totalPage++;
		}

		int startPage = (currentPage - 1) / 10 * 10 + 1;

		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		int startRow = (currentPage - 1) * COUNT_PER_PAGE;

		List<BoardVO> boardList = dao.selectSearchedList(boardCategory, keyword, startRow, COUNT_PER_PAGE);

		for (BoardVO b : boardList) {
//			String contents = b.getContent();
//			contents = contents.replace("\r\n", "<br>");
//			contents = contents.replace("\n", "<br>");
//			contents = contents.replace("\r", "<br>");
//			b.setContent(contents);
			b.setMainPic(picDao.selectPic(b.getBoardNum()));
			b.setReplyCount(repDao.totalCount(b.getBoardNum()));
		}

		return new BoardPageVO(boardList, currentPage, startPage, endPage, totalPage);
	}
	
	public BoardPageVO makeCategoryPage(int currentPage, int boardCategory) {
		int totalCount = dao.selectCategoryCount(boardCategory);

		int totalPage = totalCount / COUNT_PER_PAGE;
		if (totalCount % COUNT_PER_PAGE != 0) {
			totalPage++;
		}

		int startPage = (currentPage - 1) / 10 * 10 + 1;

		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		int startRow = (currentPage - 1) * COUNT_PER_PAGE;

		List<BoardVO> boardList = dao.selectCategoryList(boardCategory, startRow, COUNT_PER_PAGE);

		for (BoardVO b : boardList) {
//			String contents = b.getContent();
//			contents = contents.replace("\r\n", "<br>");
//			contents = contents.replace("\n", "<br>");
//			contents = contents.replace("\r", "<br>");
//			b.setContent(contents);
//			Date date = b.getWriteDate();//비교값
//			Date now = new Date();
//			if(date.compareTo(now) < 0){//비교값이 오늘날짜에 비하여 과거이면 -1반환,
//				date = date.replace("b_date", new SimpleDateFormat("MM-dd").format(date));//month-day로 포맷
//			}
//			else if(date.compareTo(now) >= 0){//비교값이 오늘날짜(0시0분)에 비하여 미래, 즉 오늘 중 이라면 1을 반환
//				date = date.replace("b_date", new SimpleDateFormat("HH:mm").format(date));//hour:minute로 포맷
//			}
			b.setMainPic(picDao.selectPic(b.getBoardNum()));
			b.setReplyCount(repDao.totalCount(b.getBoardNum()));
		}

		return new BoardPageVO(boardList, currentPage, startPage, endPage, totalPage);
	}

	public ReplyPageVO makeReplyPage(int boardNum, int currentPage) {
		int totalCount = repDao.totalCount(boardNum);

		int totalPage = totalCount / REPLY_COUNT_PER_PAGE;
		if (totalCount % REPLY_COUNT_PER_PAGE != 0) {
			totalPage++;
		}

		int startPage = (currentPage - 1) / 10 * 10 + 1;

		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		int startRow = (currentPage - 1) * REPLY_COUNT_PER_PAGE;

		List<ReplyVO> boardList = repDao.selectList(boardNum, startRow, REPLY_COUNT_PER_PAGE);

		for (ReplyVO r : boardList) {
			String contents = r.getContent();
			contents = contents.replace("\r\n", "<br>");
			contents = contents.replace("\n", "<br>");
			contents = contents.replace("\r", "<br>");
			r.setContent(contents);
			r.setProfilePicPath(memDao.selectProfilePic(r.getWriter()));
		}
		return new ReplyPageVO(boardNum, boardList, currentPage, startPage, endPage, totalPage);
	}


	public BoardPageVO bestPicList() {
		List<BoardVO> boardList = dao.bestPicList();
		for (BoardVO b : boardList) {
			b.setMainPic(picDao.selectPic(b.getBoardNum()));
		}
		return new BoardPageVO(boardList);

	}

	public void write(BoardVO board, String loginId, HttpServletRequest req) {
		board.setReadCount(0);
		board.setWriteDate(new Date());
		board.setWriter(loginId);
		dao.insert(board);
		// System.out.println("1: "+board.getUpPic());
		// System.out.println("2: "+board.getUpPic().isEmpty());
		// System.out.println("3: "+board.getUpPic().listIterator());
		// System.out.println("4: "+board.getUpPic().get(0).getSize());
		if (board.getUpPic() != null) {
			if (board.getUpPic().isEmpty() == false && board.getUpPic().get(0).getSize() > 0) {

				String uploadPath = req.getServletContext().getRealPath("img");

				File dir = new File(uploadPath);
				if (dir.exists() == false) {
					dir.mkdir();
				}

				for (MultipartFile f : board.getUpPic()) {
					String savedName = new Random().nextInt(10000000) + f.getOriginalFilename();
					File savedFile = new File(uploadPath + "/" + savedName);

					try {
						f.transferTo(savedFile);

						PictureVO picture = new PictureVO();
						picture.setBoard_num(board.getBoardNum());
						picture.setOriginName(savedName);
						picture.setRandomName(savedFile.getAbsolutePath());
						picDao.insertPic(picture);
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
	}

	public void reply(ReplyVO reply, String loginId) {
		reply.setWriter(loginId);
//		reply.setBoardNum(reply.getBoardNum());
		if (repDao.insert(reply) > 0) {
			int myNum = repDao.maxNum();
			repDao.afterInsert(myNum);
		}
	}

	public void replyComment(ReplyVO reply, String loginId) {
		reply.setWriter(loginId);
		ReplyVO parent = repDao.select(reply.getReplyNum());
		reply.setGrp(parent.getGrp());
		if (parent.getLvl() == 0) {
			reply.setSeq(repDao.maxSeq(parent.getGrp()) + 1);
			reply.setLvl(1);
		} else if (parent.getLvl() > 0) {
			reply.setSeq(parent.getSeq() + 1);
			reply.setLvl(parent.getLvl() + 1);
			repDao.updateSeq(parent.getGrp(), parent.getSeq());
		}
		repDao.insert(reply);
	}
	
	public boolean replyUpdate(ReplyVO reply, String loginId) {
		ReplyVO original = repDao.select(reply.getReplyNum());

		if (loginId != null && loginId.equals(original.getWriter())) {
			repDao.update(reply);
			return true;
		} else {
			return false;
		}
	}

	public BoardVO read(int boardNum, String loginId) {
		BoardVO board = dao.select(boardNum);
		board.setDownPic(picDao.selectListPic(boardNum));
		// board.setReply(repDao.selectListRep(boardNum));

		String contents = board.getContent();
		contents = contents.replace("\r\n", "<br>");
		contents = contents.replace("\n", "<br>");
		contents = contents.replace("\r", "<br>");
		board.setContent(contents);

		if (loginId != null && loginId.equals(board.getWriter())) {
			return board;
		} else {
			// 조회수 증가
			dao.updateReadCount(boardNum);
			board.setReadCount(board.getReadCount() + 1);
			return board;
		}
	}

	public BoardVO readNoCount(int boardNum) {
		return dao.select(boardNum);
	}

	public boolean update(BoardVO board, String loginId) {
		BoardVO original = dao.select(board.getBoardNum());

		if (loginId != null && loginId.equals(original.getWriter())) {
			board.setWriteDate(new Date());
			dao.update(board);
			return true;
		} else {
			return false;
		}
	}

	public boolean delete(int boardNum, String loginId) {
		BoardVO board = dao.select(boardNum);

		if (loginId != null && loginId.equals(board.getWriter())) {
			picDao.delete(boardNum);
			repDao.deleteAll(boardNum);
			dao.delete(boardNum);
			return true;
		} else {
			return false;
		}
	}

	public boolean replyDelete(int replyNum, String loginId) {
		ReplyVO original = repDao.select(replyNum);

		if (loginId != null && loginId.equals(original.getWriter())) {
			repDao.delete(replyNum);	
			return true;
		} else {
			return false;
		}
	}

	public int selectBoardNum(int replyNum) {
		return repDao.selectBoardNum(replyNum);
	}
	
}