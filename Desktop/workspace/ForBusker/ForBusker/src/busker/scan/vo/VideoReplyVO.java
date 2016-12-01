package busker.scan.vo;

public class VideoReplyVO {

	private int vNo;
	private String pEmail;
	private String vUrl; 
	private String vName; 
	private String vDetail; 
	private String vCount; 
	private String vLike;
	
	public int getvNo() {
		return vNo;
	}
	public void setvNo(int vNo) {
		this.vNo = vNo;
	}
	public String getpEmail() {
		return pEmail;
	}
	public void setpEmail(String pEmail) {
		this.pEmail = pEmail;
	}
	public String getvUrl() {
		return vUrl;
	}
	public void setvUrl(String vUrl) {
		this.vUrl = vUrl;
	}
	public String getvName() {
		return vName;
	}
	public void setvName(String vName) {
		this.vName = vName;
	}
	public String getvDetail() {
		return vDetail;
	}
	public void setvDetail(String vDetail) {
		this.vDetail = vDetail;
	}
	public String getvCount() {
		return vCount;
	}
	public void setvCount(String vCount) {
		this.vCount = vCount;
	}
	public String getvLike() {
		return vLike;
	}
	public void setvLike(String vLike) {
		this.vLike = vLike;
	} 
}
