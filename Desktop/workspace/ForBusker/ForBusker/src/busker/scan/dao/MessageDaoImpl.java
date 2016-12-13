package busker.scan.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.text.Document;

import org.springframework.stereotype.Repository;

import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;

import busker.scan.vo.SmsVO;

@Repository
public class MessageDaoImpl implements MessageDao {

	private static final String memberCollectionName = "Message";

	//########################################################################################################	
	//####################################쪽지 Insert###########################################################	
	//########################################################################################################		
	
	@Override
	public void Insert(SmsVO sms) throws Exception {

		DB db = MongoClientFactory.getDB(); // DB 연결

		DBCollection collection = db.getCollection(memberCollectionName); // collectionName
		
		BasicDBObject documentSend = createDocumentSend(sms);
		BasicDBObject documentRec = createDocumentRec(sms);
		
		collection.insert(documentSend);
		collection.insert(documentRec);
		 	
	}

	//########################################################################################################	
	//####################################쪽지 Insert###########################################################	
	//##############################      document 생성               ##################################################
	// mongodb create 했을때 이름 부여
	private BasicDBObject createDocumentSend(SmsVO sms) {
		BasicDBObject doc = new BasicDBObject();
		Date date = new Date();
		SimpleDateFormat smsSendTime = new SimpleDateFormat("yyyy-MM-dd a HH:mm:ss");
		doc.put("smsNo", sms.getSmsNo());					//글 내용
		doc.put("smsSendEmail", sms.getSmsSendEmail());		//보내는 이메일
		doc.put("smsContent", sms.getSmsContent());			//보내는 내용
		doc.put("smsReceiveEmail", sms.getSmsReceiveEmail());	//받는 이메일
		doc.put("smsSendTime", smsSendTime.format(date));	//보내는 시간
		doc.put("smsStatus", "1");							//읽음 상태
		doc.put("smsType", sms.getSmsType());				//글 타입
		doc.put("smsTo", sms.getSmsSendEmail());			//보내는 이메일 -고정-
		doc.put("smsDeleteStatus", "1");					//delete 여부
		return doc;
	}

	private BasicDBObject createDocumentRec(SmsVO sms) {
		BasicDBObject doc = new BasicDBObject();
		Date date = new Date();
		SimpleDateFormat smsSendTime = new SimpleDateFormat("yyyy-MM-dd a HH:mm:ss");
		doc.put("smsNo", sms.getSmsNo());					//글 내용
		doc.put("smsSendEmail", sms.getSmsSendEmail());		//보내는 이메일
		doc.put("smsContent", sms.getSmsContent());			//보내는 내용
		doc.put("smsReceiveEmail", sms.getSmsReceiveEmail());	//받는 이메일
		doc.put("smsSendTime", smsSendTime.format(date));	//보내는 시간
		doc.put("smsStatus", "1");							//읽음 상태
		doc.put("smsType", sms.getSmsType());				//글 타입
		doc.put("smsTo", sms.getSmsReceiveEmail());			//보내는 이메일 -고정-
		doc.put("smsDeleteStatus", "1");					//delete 여부
		return doc;
	}

	
	
	//########################################################################################################	
	//########################################################################################################	
	//#####################################쪽지함 셀렉트###########################################################	
	//########################################################################################################		
	@Override
	public List<SmsVO> select(String Email) throws Exception {

		DB db = MongoClientFactory.getDB(); // DB 연결

		DBCollection collection = db.getCollection(memberCollectionName);	// db.Message

		DBCursor cursor = collection.find();					// 전체를 find()

		ArrayList disListTo = (ArrayList) db.getCollection(memberCollectionName).distinct("smsTo");
		ArrayList disListType = (ArrayList) db.getCollection(memberCollectionName).distinct("smsType");

		
		List<SmsVO> selectList = new ArrayList();

		for (int j= 0; j < disListType.size(); j++){
			for (int i = 0; i < disListTo.size(); i++) { // disList.size() = 5일때
														// (0)=help@busker.com 1
				// disListTo 에 본인이 아니고 vo.getSmsTo가 본인 일때.
				if (!(disListTo.get(i).equals(Email))) {
					System.out.println(disListType.get(j));
					System.out.println(disListTo.get(i));
					
					// { "$and" : [ { "smsSendEmail" : 로그인한 사람}, { "smsTo" : 받는사람}
					BasicDBObject andQuery1 = new BasicDBObject();
					List<BasicDBObject> obj1 = new ArrayList<BasicDBObject>();
					obj1.add(new BasicDBObject("smsType",disListType.get(j)));
					obj1.add(new BasicDBObject("smsSendEmail", Email));
					obj1.add(new BasicDBObject("smsReceiveEmail", disListTo.get(i)));
					obj1.add(new BasicDBObject("smsTo", Email));			
					andQuery1.put("$and", obj1);

					// "$and" : [ { "smsSendEmail" : 보낸 사람} , { "smsTo" : 로그인한 사람}
					BasicDBObject andQuery2 = new BasicDBObject();
					List<BasicDBObject> obj2 = new ArrayList<BasicDBObject>();
					obj2.add(new BasicDBObject("smsType",disListType.get(j)));
					obj2.add(new BasicDBObject("smsSendEmail", disListTo.get(i)));
					obj2.add(new BasicDBObject("smsReceiveEmail", Email));
					obj2.add(new BasicDBObject("smsTo", Email));
					andQuery2.put("$and", obj2);
					
					// "$or" 안에 and문 다 넣기
					BasicDBObject orQuery = new BasicDBObject();
					List<BasicDBObject> ResultQuery = new ArrayList<BasicDBObject>();
					ResultQuery.add(andQuery1);
					ResultQuery.add(andQuery2);
					orQuery.put("$or", ResultQuery);

					// 오프젝트에 or 쿼리문 넣기.
					DBObject query = new BasicDBObject(orQuery);

					//////////// 값 넣기//////////////
					cursor = collection.find(query).limit(1).sort(new BasicDBObject("smsSendTime", -1));

					while (cursor.hasNext()) {
						DBObject doc = cursor.next();
						SmsVO SmsVO = new SmsVO();
						SmsVO.setSmsNo(doc.get("smsNo").toString());
						SmsVO.setSmsContent(doc.get("smsContent").toString());
						SmsVO.setSmsReceiveEmail(doc.get("smsReceiveEmail").toString());
						SmsVO.setSmsSendEmail(doc.get("smsSendEmail").toString());
						SmsVO.setSmsStatus(doc.get("smsStatus").toString());
						SmsVO.setSmsSendTime(doc.get("smsSendTime").toString());
						SmsVO.setSmsType(doc.get("smsType").toString());
						SmsVO.setSmsTo(doc.get("smsTo").toString());
						SmsVO.setSmsDeleteStatus(doc.get("smsDeleteStatus").toString());	
						selectList.add(SmsVO);
					}
				}
				
			}
		}
		return selectList;
	}

	//########################################################################################################	
	//########################################################################################################	
	//#####################################채팅방 내용 ###########################################################	
	//########################################################################################################	
	
	@Override
	public List<SmsVO> selectMessageByNoType(SmsVO sms,String Email) throws Exception {

		DB db = MongoClientFactory.getDB(); // DB 연결

		DBCollection collection = db.getCollection(memberCollectionName);

		BasicDBObject qq = new BasicDBObject();
		List<BasicDBObject> q = new ArrayList<BasicDBObject>();
		
		BasicDBObject orQuery = new BasicDBObject();
		List<BasicDBObject> obj1 = new ArrayList<BasicDBObject>();
		obj1.add(new BasicDBObject("smsType", sms.getSmsType()));
		obj1.add(new BasicDBObject("smsSendEmail", sms.getSmsSendEmail()));
		obj1.add(new BasicDBObject("smsReceiveEmail", sms.getSmsReceiveEmail()));
		obj1.add(new BasicDBObject("smsDeleteStatus", "1"));
		obj1.add(new BasicDBObject("smsTo",Email));
		orQuery.put("$and", obj1);

		BasicDBObject andQuery = new BasicDBObject();
		List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
		obj.add(new BasicDBObject("smsType", sms.getSmsType()));
		obj.add(new BasicDBObject("smsSendEmail", sms.getSmsReceiveEmail()));
		obj.add(new BasicDBObject("smsReceiveEmail", sms.getSmsSendEmail()));
		obj.add(new BasicDBObject("smsDeleteStatus", "1"));
		obj.add(new BasicDBObject("smsTo",Email));
		andQuery.put("$and", obj);

		BasicDBObject result = new BasicDBObject();
		List<BasicDBObject> ResultQuery = new ArrayList<BasicDBObject>();
		ResultQuery.add(orQuery);
		ResultQuery.add(andQuery);
		result.put("$or", ResultQuery);

		// 정렬을 위한 HashMap
		HashMap sortmap = new HashMap();
		sortmap.put("smsSendTime", 1);
		DBObject sort = new BasicDBObject(sortmap);

		DBObject query = new BasicDBObject(result);

		List<SmsVO> list = new ArrayList();

		DBCursor cursor = collection.find(query).sort(sort);

		while (cursor.hasNext()) {
			DBObject doc = cursor.next();
			SmsVO SmsVO = new SmsVO();
			SmsVO.setSmsNo(doc.get("smsNo").toString());
			SmsVO.setSmsContent(doc.get("smsContent").toString());
			SmsVO.setSmsReceiveEmail(doc.get("smsReceiveEmail").toString());
			SmsVO.setSmsSendEmail(doc.get("smsSendEmail").toString());
			SmsVO.setSmsStatus(doc.get("smsStatus").toString());
			SmsVO.setSmsSendTime(doc.get("smsSendTime").toString());
			SmsVO.setSmsType(doc.get("smsType").toString());
			list.add(SmsVO);
		}

		return list;
	}

	//########################################################################################################	
	//########################################################################################################	
	//##################################### 읽음 읽지않은 표시 ######################################################	
	//########################################################################################################	

	@Override
	public void updateMessage(SmsVO sms) throws Exception {	
		
		DB db = MongoClientFactory.getDB(); // DB 연결
		DBCollection collection = db.getCollection(memberCollectionName);
		// 해당 쿼리를 작성하고
		BasicDBObject document = new BasicDBObject("$set", new BasicDBObject("smsStatus", "0"));

		BasicDBObject orQuery = new BasicDBObject();
		List<BasicDBObject> obj1 = new ArrayList<BasicDBObject>();
		obj1.add(new BasicDBObject("smsType", sms.getSmsType()));
		obj1.add(new BasicDBObject("smsSendEmail", sms.getSmsSendEmail()));
		obj1.add(new BasicDBObject("smsReceiveEmail", sms.getSmsReceiveEmail()));
		obj1.add(new BasicDBObject("smsDeleteStatus", "1"));
		obj1.add(new BasicDBObject("smsTo",sms.getSmsSendEmail()));
		orQuery.put("$and", obj1);

		System.out.println("orQuery : " + orQuery.toString());
		BasicDBObject andQuery = new BasicDBObject();
		List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
		obj.add(new BasicDBObject("smsType", sms.getSmsType()));
		obj.add(new BasicDBObject("smsSendEmail", sms.getSmsSendEmail()));
		obj.add(new BasicDBObject("smsReceiveEmail", sms.getSmsReceiveEmail()));
		obj.add(new BasicDBObject("smsDeleteStatus", "1"));
		obj.add(new BasicDBObject("smsTo",sms.getSmsReceiveEmail()));
		andQuery.put("$and", obj);
		System.out.println("andQuery :  " +andQuery.toString());
		
		BasicDBObject result = new BasicDBObject();
		List<BasicDBObject> ResultQuery = new ArrayList<BasicDBObject>();
		ResultQuery.add(orQuery);
		ResultQuery.add(andQuery);
		result.put("$or", ResultQuery);

		System.out.println(result.toString());
		collection.updateMulti(result, document);
	}
	
	
	//########################################################################################################	
	//########################################################################################################	
	//######################################   글 내용 삭제   ######################################################	
	//########################################################################################################	

	@Override
	public void delete(SmsVO sms,String Email) throws Exception {
		DB db = MongoClientFactory.getDB(); // DB 연결
		DBCollection collection = db.getCollection(memberCollectionName);
		
		
		// 해당 쿼리를 작성하고 smsDeleteStatus 가 0으로 변경
		BasicDBObject document = new BasicDBObject("$set", new BasicDBObject("smsDeleteStatus", "0"));

		BasicDBObject orQuery = new BasicDBObject();
		List<BasicDBObject> obj1 = new ArrayList<BasicDBObject>();
		obj1.add(new BasicDBObject("smsType", sms.getSmsType()));
		obj1.add(new BasicDBObject("smsSendEmail", sms.getSmsSendEmail()));
		obj1.add(new BasicDBObject("smsReceiveEmail", sms.getSmsReceiveEmail()));
		obj1.add(new BasicDBObject("smsDeleteStatus", "1"));
		obj1.add(new BasicDBObject("smsTo",Email));
		orQuery.put("$and", obj1);

		BasicDBObject andQuery = new BasicDBObject();
		List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
		obj.add(new BasicDBObject("smsType", sms.getSmsType()));
		obj.add(new BasicDBObject("smsSendEmail", sms.getSmsReceiveEmail()));
		obj.add(new BasicDBObject("smsReceiveEmail", sms.getSmsSendEmail()));
		obj.add(new BasicDBObject("smsDeleteStatus", "1"));
		obj.add(new BasicDBObject("smsTo",Email));
		andQuery.put("$and", obj);
		
		BasicDBObject result = new BasicDBObject();
		List<BasicDBObject> ResultQuery = new ArrayList<BasicDBObject>();
		ResultQuery.add(orQuery);
		ResultQuery.add(andQuery);
		result.put("$or", ResultQuery);

		collection.updateMulti(result, document);
	}

	@Override
	public String messageCheck(String email) throws Exception {
		DB db = MongoClientFactory.getDB(); // DB 연결
		DBCollection collection = db.getCollection(memberCollectionName);
		String result = "";		
		
		DBObject Document = collection.findOne(new BasicDBObject("smsTo", email));
	
		if(Document!=null){
			result = "success";
		}else{
			result = "fail";
		}
		System.out.println(result);
		return result;
	}
		
}

/*
 * map.put("smsSendEmail", Email); map.put("smsReceiveEmail", Email);
 */
