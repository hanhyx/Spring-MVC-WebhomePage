package vo;

public class PictureVO {
	private int picture_num;
    private int board_num;
    private String originName;
    private String randomName;
    
	public PictureVO(int picture_num, int board_num, String originName, String randomName) {
		this.picture_num = picture_num;
		this.board_num = board_num;
		this.originName = originName;
		this.randomName = randomName;
	}
	
	public PictureVO(int board_num, String originName, String randomName) {
		this.board_num = board_num;
		this.originName = originName;
		this.randomName = randomName;
	}
	
	public PictureVO() {}
	
	public int getPicture_num() {
		return picture_num;
	}
	public void setPicture_num(int picture_num) {
		this.picture_num = picture_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getRandomName() {
		return randomName;
	}
	public void setRandomName(String randomName) {
		this.randomName = randomName;
	}
	@Override
	public String toString() {
		return "PictureVO [picture_num=" + picture_num + ", board_num=" + board_num + ", originName=" + originName
				+ ", randomName=" + randomName + "]";
	}
    
    

}
