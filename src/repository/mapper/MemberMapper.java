package repository.mapper;
 
import org.apache.ibatis.annotations.Param;
 
import vo.MemberVO;
 
public interface MemberMapper {
    public int insert(MemberVO member);
    public MemberVO selectMember(String id);
    public String selectProfilePic(String id);
    public int chkDupId(String id);
    public int update(MemberVO member);
    public int updatePw(MemberVO member);
    public int chkOldPw(@Param("id")String id,
            @Param("password")String password);
    public int selectMemberNum(@Param("id")String id,
                    @Param("password")String password);
}