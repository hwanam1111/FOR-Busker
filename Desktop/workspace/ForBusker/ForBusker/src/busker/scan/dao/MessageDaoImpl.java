package busker.scan.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

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

	@Override
	public void Insert(SmsVO sms) throws Exception {   

		DB db = MongoClientFactory.getDB(); // DB 연결  

		DBCollection collection = db.getCollection(memberCollectionName); // collectionName

		System.out.println("들어오는 값 : " + sms.getSmsSendEmail());

		//만약 TO or FROM 에 이메일이 존재하지 않을 경우 강제로 insert
		DBObject docu = collection.findOne(new BasicDBObject("smsTo", sms.getSmsSendEmail()));
		if (docu == null) {
			System.out.println(("여긴 들어왔니"));
			BasicDBObject findTo = new BasicDBObject();
			findTo.put("smsNo", ""); 
			findTo.put("smsSendEmail", "");
			findTo.put("smsContent", "");
			findTo.put("smsReceiveEmail", "");
			findTo.put("smsSendTime", "");
			findTo.put("smsStatus", "");
			findTo.put("smsType", "");
			findTo.put("smsTo", sms.getSmsSendEmail());
			findTo.put("smsFrom", sms.getSmsReceiveEmail());
			findTo.put("smsDeleteStatus", "");
			collection.insert(findTo);
		}	
		
		//쪽지 insert
		BasicDBObject document = createDocument(sms);
		collection.insert(document);

	}

	// mongodb create 했을때 이름 부여
	private BasicDBObject createDocument(SmsVO sms) {
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
		doc.put("smsTo", sms.getSmsTo());					//보내는 이메일 -고정-
		doc.put("smsFrom", sms.getSmsFrom());				//받는 이메일 -고정-
		doc.put("smsDeleteStatus", "1");					//delete 여부
		return doc;
	}

//########################################################################################################	
	
	@Override
	public List<SmsVO> select(String Email) throws Exception {

		DB db = MongoClientFactory.getDB(); // DB 연결

		DBCollection collection = db.getCollection(memberCollectionName);	// db.Message

		DBCursor cursor = collection.find();					// 전체를 find()

		List<SmsVO> AllList = new ArrayList();					// SmsVO 형태의 ArrayList 생성

		while (cursor.hasNext()) {
			DBObject doc = cursor.next();						
			SmsVO SmsVO = new SmsVO();
			SmsVO.setSmsNo(doc.get("smsNo").toString());
			SmsVO.setSmsContent(doc.get("smsContent").toString());
			SmsVO.setSmsReceiveEmail(doc.get("smsReceiveEmail").toString());	
			//나 A - JYJ B - RKD 30개  SELECT SEND JYJ RECEIVE-RKD 	A-JYJ
			//상대 A - JYJ B - RKD 30개  SELECT SEND RKD RECEIVE-JYJ 	A-JYJ	 A-나인것만 
			
			SmsVO.setSmsSendEmail(doc.get("smsSendEmail").toString());			
			//나 A - RKD B - JYJ 30개  SELECT SEND RKD RECEIVE-JYJ 	A'-RKD   A'-상댸꺼
			//상대 A - RKD B - JYJ 30개  SELECT SEND JYJ RECEIVE-RKD 	A'-RKD
			SmsVO.setSmsStatus(doc.get("smsStatus").toString());
			SmsVO.setSmsSendTime(doc.get("smsSendTime").toString());
			SmsVO.setSmsType(doc.get("smsType").toString());
			SmsVO.setSmsTo(doc.get("smsTo").toString());
			SmsVO.setSmsFrom(doc.get("smsFrom").toString());
			SmsVO.setSmsDeleteStatus(doc.get("smsDeleteStatus").toString());
			AllList.add(SmsVO);	
		}

		// 20개가 위에 들어오고. if(to에 받는사람이 나이고 smsSendEmail이 distinct의 사람들중 내가 아닌)

		ArrayList disListTo = (ArrayList) db.getCollection(memberCollectionName).distinct("smsTo");
		ArrayList disList = (ArrayList) db.getCollection(memberCollectionName).distinct("smsSendEmail");
		ArrayList disListNo = (ArrayList) db.getCollection(memberCollectionName).distinct("smsNo");

		List<SmsVO> selectList = new ArrayList();

		System.out.println("AlllistSize : " + AllList + "/n " + AllList.size());
		System.out.println("disListSize : " + disList + "/ " + disList.size());
		System.out.println("disListTo : " + disListTo + "/ " + disListTo.size());
		System.out.println("disListNo" + disListNo + "/ " + disListNo.size());
		System.out.println("Email :" + Email);


		for (int i = 0; i < disListTo.size(); i++) { // disList.size() = 5일때
														// (0)=help@busker.com 1

			for (SmsVO vo : AllList) { // vo를 list만큼 돌린다.

				// disListTo 에 본인이 아니고 vo.getSmsTo가 본인 일때.
				if (vo.getSmsTo().equals(Email) && !(disListTo.get(i).equals(Email))) {

					System.out.print("들어오는 email = " + Email + " ");
					System.out.print("들어오는 SmsTo = " + vo.getSmsTo() + " ");
					System.out.println("들어오는 SmsSendEmail = " + disListTo.get(i));
					System.out.println("");

					// { "$and" : [ { "smsSendEmail" : 로그인한 사람}, { "smsTo" : 받는사람}
					BasicDBObject andQuery1 = new BasicDBObject();
					List<BasicDBObject> obj1 = new ArrayList<BasicDBObject>();
					obj1.add(new BasicDBObject("smsSendEmail", disList.get(i)));
					obj1.add(new BasicDBObject("smsTo", vo.getSmsTo()));
					
					andQuery1.put("$and", obj1);

					// "$and" : [ { "smsSendEmail" : 보낸 사람} , { "smsTo" : 로그인한 사람}
					BasicDBObject andQuery2 = new BasicDBObject();
					List<BasicDBObject> obj2 = new ArrayList<BasicDBObject>();
					obj2.add(new BasicDBObject("smsSendEmail", vo.getSmsTo()));
					obj2.add(new BasicDBObject("smsTo", disListTo.get(i)));
					
					andQuery2.put("$and", obj2);

					// "$and" : [ { "smsSendEmail" : 보낸사람 }, {"smsReceiveEmail" : 로그인한 사람 }
					BasicDBObject andQuery3 = new BasicDBObject();
					List<BasicDBObject> obj3 = new ArrayList<BasicDBObject>();
					obj3.add(new BasicDBObject("smsSendEmail", disListTo.get(i))); //disListTo.get(i)
					obj3.add(new BasicDBObject("smsReceiveEmail", vo.getSmsTo())); //vo.getSmsTo()
 					
					andQuery3.put("$and", obj3);

					BasicDBObject andQuery4 = new BasicDBObject();
					List<BasicDBObject> obj4 = new ArrayList<BasicDBObject>();
					obj4.add(new BasicDBObject("smsSendEmail", vo.getSmsTo())); //disListTo.get(i)
					obj4.add(new BasicDBObject("smsReceiveEmail", disListTo.get(i))); //vo.getSmsTo()
 					
					andQuery3.put("$and", obj4);

					
					// "$or" 안에 and문 다 넣기
					BasicDBObject orQuery = new BasicDBObject();
					List<BasicDBObject> ResultQuery = new ArrayList<BasicDBObject>();
					ResultQuery.add(andQuery1);
					ResultQuery.add(andQuery2);
					ResultQuery.add(andQuery3);
					ResultQuery.add(andQuery4);
					orQuery.put("$or", ResultQuery);

					// 오프젝트에 or 쿼리문 넣기.
					DBObject query = new BasicDBObject(orQuery);

					// System.out.println("andQuery : " + andQuery1 );
					// System.out.println("andQuery2 : " + andQuery2 );
					// System.out.println("andQuery3 : " + andQuery3 );
					// System.out.println("orQuery : " + orQuery.toString());
					// System.out.println("query : " + query.toString());

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
						SmsVO.setSmsFrom(doc.get("smsFrom").toString());
						SmsVO.setSmsDeleteStatus(doc.get("smsDeleteStatus").toString());	
						/*// 만약 To가 나이면서
						if (!(SmsVO.getSmsTo().equals(Email))) {
							SmsVO.setSmsSendEmail(doc.get("smsTo").toString());
							SmsVO.setSmsTo(doc.get("smsSendEmail").toString());
							
						}*/
						selectList.add(SmsVO);
					}

					break; /////// 넣고 반복문 빠져나오기 AllList 1 SmsVO \
				} else {
					continue;
				}
			}

		}

		for(SmsVO s : selectList){
			System.out.println("번호 : " +s.getSmsNo());
			System.out.println("받는이  :" +s.getSmsReceiveEmail());
			System.out.println("보내는이  : " +s.getSmsSendEmail());
			System.out.println("누구에게 보내는 :  " +s.getSmsTo());
			System.out.println("보내는 내용 " + s.getSmsContent());
			
		}
		// System.out.println("disList size = "+ disList.size());
		// System.out.println("들어온 selectList의 사이즈 = 4 : " + selectList.size());
		return selectList;
	}

	//########################################################################################################	
	
	
	@Override
	public void delete(SmsVO sms) throws Exception {
		DB db = MongoClientFactory.getDB(); // DB 연결
		DBCollection collection = db.getCollection(memberCollectionName);
		// 해당 쿼리를 작성하고
		BasicDBObject document = new BasicDBObject("$set", new BasicDBObject("smsDeleteStatus", "0"));

		BasicDBObject orQuery = new BasicDBObject();
		List<BasicDBObject> obj1 = new ArrayList<BasicDBObject>();
//		obj1.add(new BasicDBObject("smsNo", sms.getSmsNo()));
		obj1.add(new BasicDBObject("smsSendEmail", sms.getSmsSendEmail()));
		obj1.add(new BasicDBObject("smsReceiveEmail", sms.getSmsReceiveEmail()));
		orQuery.put("$and", obj1);

		BasicDBObject andQuery = new BasicDBObject();
		List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
//		obj.add(new BasicDBObject("smsNo", sms.getSmsNo()));
		obj.add(new BasicDBObject("smsSendEmail", sms.getSmsReceiveEmail()));
		obj.add(new BasicDBObject("smsReceiveEmail", sms.getSmsSendEmail()));
		andQuery.put("$and", obj);

		BasicDBObject result = new BasicDBObject();
		List<BasicDBObject> ResultQuery = new ArrayList<BasicDBObject>();
		ResultQuery.add(orQuery);
		ResultQuery.add(andQuery);
		result.put("$or", ResultQuery);

		collection.updateMulti(result, document);
		
		
	}

	//########################################################################################################	
	
	//########################################################################################################	
	//#####################################채팅방 내용 ###########################################################	
	//########################################################################################################	
	
	@Override
	public List<SmsVO> selectMessageByNoType(SmsVO sms) throws Exception {

		DB db = MongoClientFactory.getDB(); // DB 연결

		DBCollection collection = db.getCollection(memberCollectionName);
		System.out.println("받는 사람 " + sms.getSmsReceiveEmail());
		System.out.println("보낸 사람" + sms.getSmsSendEmail());

		/*
		 * HashMap map = new HashMap(); map.put("smsNo", sms.getSmsNo());
		 * map.put("smsType", sms.getSmsType());
		 * map.put("smsSendEmail",sms.getSmsSendEmail());
		 */
		BasicDBObject qq = new BasicDBObject();
		List<BasicDBObject> q = new ArrayList<BasicDBObject>();

		/*
		 * db.Message.find( { $or : [ { $and :[ {"smsSendEmail" :
		 * "rkdans79@naver.com"}, {"smsNo" : "21"},
		 * {"smsTo":"jyj93kl@naver.com"}, {"smsType":"후원하기" } ] }, { $and :[
		 * {"smsSendEmail" : "jyj93kl@naver.com" }, {"smsNo" : "21" },
		 * {"smsTo":"rkdans79@naver.com"}, {"smsType":"후원하기"} ] } ] } )
		 */

		
		BasicDBObject orQuery = new BasicDBObject();
		List<BasicDBObject> obj1 = new ArrayList<BasicDBObject>();
	//	obj1.add(new BasicDBObject("smsNo", sms.getSmsNo()));
		obj1.add(new BasicDBObject("smsSendEmail", sms.getSmsSendEmail()));
		obj1.add(new BasicDBObject("smsReceiveEmail", sms.getSmsReceiveEmail()));
		obj1.add(new BasicDBObject("smsDeleteStatus", "1"));
		// obj1.add(new BasicDBObject("smsType", sms.getSmsType()));
		orQuery.put("$and", obj1);

		BasicDBObject andQuery = new BasicDBObject();
		List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
	//	obj.add(new BasicDBObject("smsNo", sms.getSmsNo()));
		obj.add(new BasicDBObject("smsSendEmail", sms.getSmsReceiveEmail()));
		obj.add(new BasicDBObject("smsReceiveEmail", sms.getSmsSendEmail()));
		obj.add(new BasicDBObject("smsDeleteStatus", "1"));
		// obj.add(new BasicDBObject("smsType", sms.getSmsType()));
		andQuery.put("$and", obj);

		BasicDBObject result = new BasicDBObject();
		List<BasicDBObject> ResultQuery = new ArrayList<BasicDBObject>();
		ResultQuery.add(orQuery);
		ResultQuery.add(andQuery);
		result.put("$or", ResultQuery);

		 System.out.println(result.toString());

		// map.put("smsTo", sms.getSmsReceiveEmail());

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
			 System.out.println(doc.get("smsNo").toString() + " : " +
			 doc.get("smsSendTime").toString());
			list.add(SmsVO);
		}

		return list;
	}

	@Override
	public void updateMessage(SmsVO sms) throws Exception {
		DB db = MongoClientFactory.getDB(); // DB 연결
		DBCollection collection = db.getCollection(memberCollectionName);
		// 해당 쿼리를 작성하고
		BasicDBObject document = new BasicDBObject("$set", new BasicDBObject("smsStatus", "0"));

		BasicDBObject orQuery = new BasicDBObject();
		List<BasicDBObject> obj1 = new ArrayList<BasicDBObject>();
//		obj1.add(new BasicDBObject("smsNo", sms.getSmsNo()));
		obj1.add(new BasicDBObject("smsSendEmail", sms.getSmsSendEmail()));
		obj1.add(new BasicDBObject("smsReceiveEmail", sms.getSmsReceiveEmail()));
		orQuery.put("$and", obj1);

		BasicDBObject andQuery = new BasicDBObject();
		List<BasicDBObject> obj = new ArrayList<BasicDBObject>();
//		obj.add(new BasicDBObject("smsNo", sms.getSmsNo()));
		obj.add(new BasicDBObject("smsSendEmail", sms.getSmsReceiveEmail()));
		obj.add(new BasicDBObject("smsReceiveEmail", sms.getSmsSendEmail()));
		andQuery.put("$and", obj);

		BasicDBObject result = new BasicDBObject();
		List<BasicDBObject> ResultQuery = new ArrayList<BasicDBObject>();
		ResultQuery.add(orQuery);
		ResultQuery.add(andQuery);
		result.put("$or", ResultQuery);

		collection.updateMulti(result, document);
	}
}

/*
 * map.put("smsSendEmail", Email); map.put("smsReceiveEmail", Email);
 */
