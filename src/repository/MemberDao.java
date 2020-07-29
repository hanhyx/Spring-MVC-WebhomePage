package repository;
 
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
 
import repository.mapper.MemberMapper;
import vo.MemberVO;
 
@Component
public class MemberDao {
    @Autowired
    private SqlSessionTemplate session;
     
    public int insert(MemberVO member) {
        MemberMapper mapper = 
                session.getMapper(MemberMapper.class);
        return mapper.insert(member);
    }
     
    public MemberVO select(String id) {
        MemberMapper mapper = 
                session.getMapper(MemberMapper.class);
        return mapper.selectMember(id);
    }
    
    public String selectProfilePic(String id) {
    	MemberMapper mapper = 
                session.getMapper(MemberMapper.class);
        return mapper.selectProfilePic(id);
    }
    
    public int chkDupId(String id) {
    	MemberMapper mapper = 
                session.getMapper(MemberMapper.class);
        return mapper.chkDupId(id);
    }
    
    public int update(MemberVO member) {
    	MemberMapper mapper = 
                session.getMapper(MemberMapper.class);
        return mapper.update(member);
    }
    
    public int updatePw(MemberVO member) {
    	MemberMapper mapper = 
                session.getMapper(MemberMapper.class);
        return mapper.updatePw(member);
    }
    
    public int chkOldPw(String id, String password) {
    	MemberMapper mapper = 
                session.getMapper(MemberMapper.class);
        return mapper.chkOldPw(id, password);
    }
    
    public int selectMemberNum(String id, String pw) {
        MemberMapper mapper = 
                session.getMapper(MemberMapper.class);
        return mapper.selectMemberNum(id, pw);
    }
}