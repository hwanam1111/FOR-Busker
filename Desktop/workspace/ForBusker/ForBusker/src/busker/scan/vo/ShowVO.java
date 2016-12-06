package busker.scan.vo;

public class ShowVO {

	private int shNo;
	private String memEmail;
	private String shTeamName;
	private String shVideo;
	private String shName;
	private String shMapLati;
	private String shMapLongi;
	private String shMapCoords;
	private String shMapAddr;
	private String shMapDetail;
	private String shDateTime;
	private String shTime;
	private String shDate;
	private String shType;
	private String shDetail;
	
	public int getShNo() {
		return shNo;
	}
	public void setShNo(int shNo) {
		this.shNo = shNo;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getShTeamName() {
		return shTeamName;
	}
	public void setShTeamName(String shTeamName) {
		this.shTeamName = shTeamName;
	}
	public String getShVideo() {
		return shVideo;
	}
	public void setShVideo(String shVideo) {
		this.shVideo = shVideo;
	}
	public String getShName() {
		return shName;
	}
	public void setShName(String shName) {
		this.shName = shName;
	}
	public String getShMapLati() {
		return shMapLati;
	}
	public void setShMapLati(String shMapLati) {
		this.shMapLati = shMapLati;
	}
	public String getShMapLongi() {
		return shMapLongi;
	}
	public void setShMapLongi(String shMapLongi) {
		this.shMapLongi = shMapLongi;
	}
	public String getShMapCoords() {
		return shMapCoords;
	}
	public void setShMapCoords(String shMapCoords) {
		this.shMapCoords = shMapCoords;
	}
	public String getShMapAddr() {
		return shMapAddr;
	}
	public void setShMapAddr(String shMapAddr) {
		this.shMapAddr = shMapAddr;
	}
	public String getShMapDetail() {
		return shMapDetail;
	}
	public void setShMapDetail(String shMapDetail) {
		this.shMapDetail = shMapDetail;
	}
	public String getShDate() {
		return shDate;
	}
	public void setShDate(String shDate) {
		this.shDate = shDate;
	}
	public String getShTime() {
		return shTime;
	}
	public void setShTime(String shTime) {
		this.shTime = shTime;
	}
	public String getShType() {
		return shType;
	}
	public void setShType(String shType) {
		this.shType = shType;
	}
	public String getShDetail() {
		return shDetail;
	}
	public void setShDetail(String shDetail) {
		this.shDetail = shDetail;
	}

	public String getShDateTime() {
		return shDateTime;
	}
	public void setShDateTime(String shDateTime) {
		this.shDateTime = shDateTime;
		String[] array;
		array = (this.shDateTime).split(" ");
		
		this.setShDate(array[0]);
		this.setShTime(array[1]);
	}
}
