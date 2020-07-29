package service;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import repository.MemberDao;
import vo.BoardVO;
import vo.MemberVO;

@Component
public class MemberService {
	@Autowired
	private MemberDao dao;

	// ȸ������ �޼ҵ�
	public boolean join(MemberVO member, HttpServletRequest req) {
		String uploadPath = req.getServletContext().getRealPath("img");

		File dir = new File(uploadPath);
		if (dir.exists() == false) {
			dir.mkdir();
		}
		
		if (member.getProfilepic() != null && (!member.getProfilepic().isEmpty()
				&& member.getProfilepic().getSize() > 0)) {
			
			String savedName = new Random().nextInt(10000000) + member.getProfilepic().getOriginalFilename();

			File savedFile = new File(uploadPath + "/" + savedName);

			try {
				member.getProfilepic().transferTo(savedFile);
				member.setProfilePicPath(savedName);
				if (dao.insert(member) > 0) {
					return true;
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		} else {
			member.setProfilePicPath("no_profile.png");
			// ������ ���°��
				if (dao.insert(member) > 0) {
					return true;
				}else {
					return false;
				}
		}
		
		return false;
	}
	//ȸ������ ����
	public boolean update(MemberVO member, String loginId, HttpServletRequest req) {
		MemberVO original = dao.select(member.getId());

		if (loginId != null && loginId.equals(original.getId())) {
			String uploadPath = req.getServletContext().getRealPath("img");

			File dir = new File(uploadPath);
			if (dir.exists() == false) {
				dir.mkdir();
			}

			if (member.getProfilepic() != null
					&& (!member.getProfilepic().isEmpty() && member.getProfilepic().getSize() > 0)) {

				String savedName = new Random().nextInt(10000000) + member.getProfilepic().getOriginalFilename();

				File savedFile = new File(uploadPath + "/" + savedName);

				try {
					member.getProfilepic().transferTo(savedFile);
					member.setProfilePicPath(savedName);
					if (dao.update(member) > 0) {
						return true;
					}
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}

			} else {
				member.setProfilePicPath("no_profile.png");
				// ������ ���°��
				if (dao.update(member) > 0) {
					return true;
				}
			}
		}
		return false;

	}
	//���̵� �ߺ��˻�
	public int chkDupId(String id) {
		return dao.chkDupId(id);
	}
	
	//��й�ȣ�˻�
	public int chkOldPw(String loginId, String password) {
		return dao.chkOldPw(loginId, password);
	}
	
	//��й�ȣ ����
		public int updatePw(MemberVO member) {
			return dao.updatePw(member);
		}

	// �α��� �޼ҵ�
	public boolean login(String id, String pw) {
		if (dao.selectMemberNum(id, pw) == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	//ȸ������ ��ȸ
	public MemberVO getMemberInfo(String loginId) {
		return dao.select(loginId);
	}
	
}