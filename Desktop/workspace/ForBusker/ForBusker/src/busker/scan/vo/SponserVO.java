package busker.scan.vo;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Random;

import org.springframework.web.multipart.MultipartFile;

public class SponserVO {
	
	private static Random random = new Random();
	
	private int spNo;
	private String memEmail;
	private String spName;
	private String spPhoto;
	private String spContent;
	private String spCond;
	private String spTel;
	
	MultipartFile file;
	
	public int getSpNo() {
		return spNo;
	}
	public void setSpNo(int spNo) {
		this.spNo = spNo;
	}
	public String getMemEmail() {
		return memEmail;
	}
	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}
	public String getSpName() {
		return spName;
	}
	public void setSpName(String spName) {
		this.spName = spName;
	}
	public String getSpPhoto() {
		return spPhoto;
	}
	public void setSpPhoto(String spPhoto) {
		this.spPhoto = spPhoto;
	}
	public String getSpContent() {
		return spContent;
	}
	public void setSpContent(String spContent) {
		this.spContent = spContent;
	}
	public String getSpCond() {
		return spCond;
	}
	public void setSpCond(String spCond) {
		this.spCond = spCond;
	}
	public String getSpTel() {
		return spTel;
	}
	public void setSpTel(String spTel) {
		this.spTel = spTel;
	}
	

	public MultipartFile getFile() {
		return file;
	}
	public void setFile(MultipartFile file) {
		this.file = file;
		
		if(! file.isEmpty()){
			
			try {
				System.out.println(file.getOriginalFilename());
//				this.spPhoto =  save("C:\\Users\\user\\git\\FOR-Busker1\\Desktop\\workspace\\ForBusker\\ForBusker\\WebContent\\upload\\",
//						 file.getInputStream());
//				this.spPhoto =  save("C:\\FinalProject\\finalworkspace\\ForBusker\\WebContent\\upload",
//						 file.getInputStream());
			
				this.spPhoto =  save("C:\\Users\\kosta\\git\\FOR-Busker\\Desktop\\workspace\\ForBusker\\ForBusker\\WebContent\\upload\\",
						 file.getInputStream());
				
			} catch (IllegalStateException e) {				
				e.printStackTrace();
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}else{
		this.spPhoto = "null";
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
