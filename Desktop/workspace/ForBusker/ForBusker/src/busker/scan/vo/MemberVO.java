package busker.scan.vo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {

	private static Random random = new Random();

	private String memEmail;
	private String memName;
	private String memPw;
	private String memNick;
	private String memPhone;
	private String memTeamType;
	private String memTeamName;
	private String memLeader;
	private String memVideo;
	private String memDetail;
	private String memStatus;
	private String memType;
	private String memTeamPhoto;
	
	MultipartFile file;
	
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemNick() {
		return memNick;
	}
	public void setMemNick(String memNick) {
		this.memNick = memNick;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemTeamType() {
		return memTeamType;
	}
	public void setMemTeamType(String memTeamType) {
		this.memTeamType = memTeamType;
	}
	public String getMemTeamName() {
		return memTeamName;
	}
	public void setMemTeamName(String memTeamName) {
		this.memTeamName = memTeamName;
	}
	public String getMemLeader() {
		return memLeader;
	}
	public void setMemLeader(String memLeader) {
		this.memLeader = memLeader;
	}
	public String getMemVideo() {
		return memVideo;
	}
	public void setMemVideo(String memVideo) {
		this.memVideo = memVideo;
	}
	public String getMemDetail() {
		return memDetail;
	}
	public void setMemDetail(String memDetail) {
		this.memDetail = memDetail;
	}
	public String getMemStatus() {
		return memStatus;
	}
	public void setMemStatus(String memStatus) {
		this.memStatus = memStatus;
	}
	public String getMemType() {
		return memType;
	}
	public void setMemType(String memType) {
		this.memType = memType;
	}
	public String getMemTeamPhoto() {
		return memTeamPhoto;
	}
	public void setMemTeamPhoto(String memTeamPhoto) {
		this.memTeamPhoto = memTeamPhoto;
	}

	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		
		if(! file.isEmpty()){
			
			try {
				System.out.println(file.getOriginalFilename());
				this.memTeamPhoto =  save("C:\\Users\\kosta\\git\\FOR-Busker1\\Desktop\\workspace\\ForBusker\\ForBusker\\WebContent\\upload\\",
						 file.getInputStream());
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}else{
		this.memTeamPhoto = "null";
		}
	}	
	

//들어오는 파일의 이름을 숫자로 바꿔주는 메소드 
	public static String save(String directory, InputStream is)
			throws IOException {
		
		long currentTime = System.currentTimeMillis();
		int randomValue = random.nextInt(50);
		String fileName = Long.toString(currentTime) + "_"
				+ Integer.toString(randomValue);

		File file = new File(directory, fileName);
		FileOutputStream os = null;
		try {
			System.out.println(file.getName());
			os = new FileOutputStream(file);
			byte[] data = new byte[8096];
			int len = -1;
			while ((len = is.read(data)) != -1) {
				os.write(data, 0, len);
			}
		} finally {
			if (os != null)
				try {
					os.close();
				} catch (IOException e) {
				}
		}
		System.out.println(file.getName());
		return file.getName();	//file.getAbsolutePath();
	}
	
	
}