package busker.scan.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import busker.scan.service.ShowService;
import busker.scan.vo.ShowVO;
import busker.scan.vo.SmsVO;



@Controller
public class ShowController {
	
	@Autowired
	private ShowService service;

	@RequestMapping(value="ShowRegistCompleteForm")
	public String ShowRegist(ShowVO showVO,Model m) throws Exception{
		System.out.println("showRegistCompleteForm으로 이동");
		System.out.println("shocontroller에서 showvo값"+showVO.getMemEmail());
		System.out.println("shocontroller에서 이름이라도..="+showVO.getShName());
		System.out.println("shocontroller에서 date="+showVO.getShDate());
		System.out.println("shocontroller에서 time="+showVO.getShTime());
		int result = service.insertShow(showVO);
		if(result == 1){
			System.out.println("공연등록성공");
		}else{
			System.out.println("공연등록실패");
		}
		m.addAttribute("showvo",showVO);
		
		return "showView/showRegistCompleteForm";
	}
	@RequestMapping(value="selectShowByNum",produces = "application/text; charset=utf8")
	@ResponseBody
	public String selectShowByNum(int shNo){
		ShowVO vo=service.selectShowByNum(shNo);
	
			JSONObject json = new JSONObject();
			json.put("shTeamName",vo.getShTeamName());
			json.put("shVideo",vo.getShVideo());
			json.put("shName",vo.getShName());
			json.put("shMapCoords",vo.getShMapCoords());
			json.put("shMapAddr",vo.getShMapAddr());
			json.put("shMapDetail",vo.getShMapDetail());
			json.put("shTime",vo.getShTime());
			json.put("shDate",vo.getShDate());
			json.put("shType",vo.getShType());
			json.put("shDetail",vo.getShDetail());

				
		return json.toString();	
	}
	@RequestMapping(value="showRegistUploadInfo")
	public String ShowRegistUploadInfo(){
		return "showView/showRegistUploadInfo";
	}
	
	@RequestMapping(value="selectShowByNum2")
	public String selectShowByNum2(int shNo,Model m){
		
		ShowVO vo=service.selectShowByNum(shNo);
		System.out.println("video"+vo.getShVideo());
		m.addAttribute("show",vo);
		return "showView/showView";		

	}
	
	
}
