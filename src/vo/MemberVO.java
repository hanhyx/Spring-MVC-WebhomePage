package vo;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
    private int member_num;
    private String id;
    private String password;
    private String name;
    private String phone;
    private String email;
    private MultipartFile profilepic;
    private String profilePicPath;
    private String question;
    private String answer;
    
	public MemberVO(int member_num, String id, String password, String name, String phone, String email,
			MultipartFile profilepic, String profilePicPath, String question, String answer) {
		this.member_num = member_num;
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.profilepic = profilepic;
		this.profilePicPath = profilePicPath;
		this.question = question;
		this.answer = answer;
	}
    
	public MemberVO(String id, String password, String name, String phone, String email,
			MultipartFile profilepic, String profilePicPath, String question, String answer) {
		this.id = id;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.profilepic = profilepic;
		this.profilePicPath = profilePicPath;
		this.question = question;
		this.answer = answer;
	}
	
	public MemberVO() {}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public MultipartFile getProfilepic() {
		return profilepic;
	}

	public void setProfilepic(MultipartFile profilepic) {
		this.profilepic = profilepic;
	}

	public String getProfilePicPath() {
		return profilePicPath;
	}

	public void setProfilePicPath(String profilePicPath) {
		this.profilePicPath = profilePicPath;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	@Override
	public String toString() {
		return "MemberVO [member_num=" + member_num + ", id=" + id + ", password=" + password + ", name=" + name
				+ ", phone=" + phone + ", email=" + email + ", profilepic=" + profilepic + ", profilePicPath="
				+ profilePicPath + ", question=" + question + ", answer=" + answer + "]";
	}
	
    
}