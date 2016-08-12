package com.mangosoft.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;













import com.mangosoft.Global;
import com.mangosoft.service.ChatService;
import com.mangosoft.service.HeartSayService;
import com.mangosoft.service.InterestService;
import com.mangosoft.service.PeopleCharService;
import com.mangosoft.service.PeopleTypeService;
import com.mangosoft.service.PhotoService;
import com.mangosoft.service.RegionService;
import com.mangosoft.service.UserService;
import com.mangosoft.service.WeixinApiService;
import com.mangosoft.vo.Chat;
import com.mangosoft.vo.Heartsay;
import com.mangosoft.vo.Interest;
import com.mangosoft.vo.PeopleChar;
import com.mangosoft.vo.PeopleType;
import com.mangosoft.vo.Region;
import com.mangosoft.vo.User;

@Controller
@RequestMapping("/weixinpro")
public class WeixinProController {
	private static final Logger logger = Logger.getLogger(WeixinProController.class);
	String page = "/error";
	private UserService userService;
	private WeixinApiService weixinApiService;
	private RegionService regionService;
	private ChatService chatService;
	private HeartSayService heartSayService;
	private PeopleTypeService peopleTypeService;
	private PeopleCharService peopleCharService;
	private InterestService InterestService;
	private PhotoService photoService;
	@Resource(type = PhotoService.class)
	public void setPhotoService(PhotoService photoService){
		this.photoService = photoService;
	}
	
	@Resource(type = UserService.class)
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	@Resource(type=WeixinApiService.class)
	public void setWeixinApiService(WeixinApiService weixinApiService){
		this.weixinApiService = weixinApiService;
	}
	@Resource(type=RegionService.class)
	public void setRegionService(RegionService regionService){
		this.regionService = regionService;
	}
	@Resource(type=ChatService.class)
	public void setChatService(ChatService chatService){
		this.chatService = chatService;
	}
	@Resource(type = HeartSayService.class)
	public void setHeartSayService(HeartSayService heartSayService){
		this.heartSayService = heartSayService;
	}
	@Resource(type = PeopleTypeService.class)
	public void setPeopleTypeService(PeopleTypeService peopleTypeService) {
		this.peopleTypeService = peopleTypeService;
	}
	@Resource(type = PeopleCharService.class)
	public void setPeopleCharService(PeopleCharService peopleCharService) {
		this.peopleCharService = peopleCharService;
	}
	@Resource(type = InterestService.class)
	public void setInterestService(InterestService interestService) {
		InterestService = interestService;
	}
	@RequestMapping(value="/ajax")
    public String doajax( HttpServletResponse response, HttpServletRequest request){
		response.setCharacterEncoding("utf-8");
		User user = (User) request.getSession().getAttribute("sessionuser");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String ajaxtype = request.getParameter("ajaxtype");
		if (ajaxtype.equals("1")) { // ʡ
			List<Region> list = regionService.getRegion_pro();

			
			out.print(JSONArray.fromObject(list).toString());

		} else if (ajaxtype.equals("2")) { // ��
			String cityid = request.getParameter("cityid");
			List<Region> list = regionService.getRegion_city(cityid);

			out.print(JSONArray.fromObject(list).toString());

		}else if (ajaxtype.equals("age")) { // ��
			String age = request.getParameter("age");
			String openid = request.getParameter("openid");
			if(openid!=null && age!=null){
				
				if(user!=null){
					userService.setUserAge(user, age);
				}
				
			}
			

		}else if (ajaxtype.equals("heartsay")) { // ��
			String heartsay = request.getParameter("heartsay");
			String userIds = request.getParameter("userIds");
			System.out.println("userIds:"+userIds);
			System.out.println("heartsay:"+heartsay);
			if(heartsay!=null){
				if(user!=null){
					userService.setUserheartsay(user, heartsay);
				}
			}
			if(userIds!=null  && !"".equals(userIds)){
				String[] ids = userIds.split(",");
				for (int i = 0; i < ids.length; i++) {
					//System.out.println(ids[i]);
					User userto = userService.getUserByid(ids[i]);
					Chat  chat = chatService.saysomthing(user, userto, Global.sayhello);
					if(chat!=null){
						weixinApiService.sendMsg(user, userto,  Global.sayhello, chat.getId().toString());
					}else{
						logger.info("未能成功获得cid");
					}
					
				}
			}
			

		}else if (ajaxtype.equals("basic_info")) { // 
			String nick_name = request.getParameter("nick_name");
			String year = request.getParameter("year");
			String month = request.getParameter("month");
			String day = request.getParameter("day");
			String height = request.getParameter("height");
			String province = request.getParameter("province");
			String city = request.getParameter("city");
			String weight = request.getParameter("weight");
			String blood_type = request.getParameter("blood_type");
			String edu = request.getParameter("edu");
			String work = request.getParameter("work");
			String income = request.getParameter("income");
			String marry_type = request.getParameter("marry_type");
			String have_house = request.getParameter("have_house");
			userService.setUserBasic(user, nick_name, year, month, day, height, province, city, weight, blood_type, edu, work, income, marry_type, have_house);

		}else if (ajaxtype.equals("more_info")) { // 
			String need_baby = request.getParameter("need_baby_id");
			String diff_area_love = request.getParameter("diff_area_love_id");
			String lover_type = request.getParameter("lover_type_id");
			String sex_first = request.getParameter("sex_first_id");
			String live_with_parent = request.getParameter("live_with_parent_id");
			String charm = request.getParameter("charm_id");
			String characteristic = request.getParameter("characteristic");
			String interest = request.getParameter("interest");
			userService.setUserMoreInfo(user, need_baby, diff_area_love, lover_type, sex_first, live_with_parent, charm, characteristic, interest);

		}else if(ajaxtype.equals("match_info")){
			String con_age_min = request.getParameter("con_age_min");
			String con_age_max = request.getParameter("con_age_max");
			String con_height_min = request.getParameter("con_height_min");
			String con_height_max = request.getParameter("con_height_max");
			String con_income = request.getParameter("con_income");
			String con_province = request.getParameter("con_province");
			String con_edu = request.getParameter("con_edu");
			userService.setUserMatch(user, con_age_min, con_age_max, con_height_min, con_height_max, con_income, con_province, con_edu);
		}else if(ajaxtype.equals("chatlist")){
			
			String offset = request.getParameter("offset");
			int intoffset = 0;
			if(offset!=null && !offset.equals("")){
				intoffset = Integer.parseInt(offset);
			}
			List<Chat> list =chatService.getChatList(user, intoffset, 6);
			//System.out.println(list.toString());
			//JsonConfig jsonConfig = new JsonConfig();

			//jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
			JSONArray jsonarray = new JSONArray();
			for (int i = 0; i < list.size(); i++) {
				Chat chat = list.get(i);
				JSONObject j = new JSONObject();
				j.put("id", chat.getId());
				j.put("from_id", chat.getXlUserByChatFrom().getId());
				j.put("from_openid", chat.getXlUserByChatFrom().getUserOpenid());
				//j.put("content", chat.getChatContent());
					j.put("readed", chat.getReaded());
				j.put("photo", chat.getXlUserByChatFrom().getPhoto());
				j.put("from_name", chat.getXlUserByChatFrom().getName());
				j.put("from_age", chat.getXlUserByChatFrom().getAge());
			    j.put("from_p", regionService.getRegion(chat.getXlUserByChatFrom()).getRegionName());
			    j.put("from_height", chat.getXlUserByChatFrom().getUserinfo().getHeight());
			    Calendar c1=Calendar.getInstance();
			    Calendar c2=Calendar.getInstance();
			    c1.setTime(new Date());
			    c2.setTime(chat.getSendtime());
			    long l=c1.getTimeInMillis()-c2.getTimeInMillis();
			    int days=new Long(l/(1000*60*60*24)).intValue();
			    System.out.println("ʱ�����:"+days);
			    if(days==0){
			    	SimpleDateFormat sdf=new SimpleDateFormat("HH:mm");
					j.put("time", sdf.format(c2.getTime()));
			    	j.put("isNew", "0");
			    }else if(days>0 && days<3){
			    	SimpleDateFormat sdf=new SimpleDateFormat("MM-dd");
					j.put("time", sdf.format(c2.getTime()));
			    	j.put("isNew", "0");
			    }else if(days>365){
			    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
					j.put("time", sdf.format(c2.getTime()));
			    	j.put("isNew", "1");
			    }else{
			    	SimpleDateFormat sdf=new SimpleDateFormat("MM-dd");
					j.put("time", sdf.format(c2.getTime()));
			    	j.put("isNew", "1");
			    }
			    jsonarray.add(j);
			}
			out.print(jsonarray.toString());
		}else if(ajaxtype.equals("chatforme")){
			String matchid = request.getParameter("matchid");
			List<Chat> list = chatService.getChat(matchid, user.getId().toString());
			JSONArray jsonarray = new JSONArray();
			for (int i = 0; i < list.size(); i++) {
				Chat chat = list.get(i);
				JSONObject j = new JSONObject();
				j.put("content", chat.getChatContent());
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
				j.put("sendtime", sdf.format(chat.getSendtime()));
				j.put("photo", chat.getXlUserByChatFrom().getPhoto());
				j.put("from_id", chat.getXlUserByChatFrom().getId());
				j.put("to_id", chat.getXlUserByChatTo().getId());
			    jsonarray.add(j);
			}
			out.print(jsonarray.toString());
		}else if(ajaxtype.equals("chatsay")){
			String matchid = request.getParameter("matchid");
			String content = request.getParameter("content");
			
			User userto = userService.getUserByid(matchid);
			Chat chat = chatService.saysomthing(user, userto, content);
			weixinApiService.sendMsg(user, userto, content, chat.getId().toString());
	    	out.print("success");
		}else if(ajaxtype.equals("sayhello")){
			String userId = request.getParameter("userId");
			User userto = userService.getUserByid(userId);
			Chat chat =chatService.saysomthing(user, userto, Global.sayhello);
			weixinApiService.sendMsg(user, userto, Global.sayhello, chat.getId().toString());
	    	out.print("success");
		}else if(ajaxtype.equals("needphoto")){
			String sourceId = request.getParameter("sourceId");
			User userto = userService.getUserByid(sourceId);
			Chat chat =chatService.saysomthing(user, userto, Global.sayneedphoto);
			weixinApiService.sendMsg(user, userto, Global.sayneedphoto, chat.getId().toString());
	    
	    	out.print("success");
			
		}
		out.close();
	return null;
	}
	@RequestMapping(value="/web")
    public String doweb( HttpServletResponse response, HttpServletRequest request){
		
		String action = request.getParameter("action");
		User user = (User) request.getSession().getAttribute("sessionuser");
		if(user.getIsweixinuser()==0){
			userService.updateLogintime(user);   //更新登录时间
		}
		request.setAttribute("user", user);
		
		if(user.getAge()==null || user.getAge()==0){
			page="/age_select";
		
		}else if(user.getHeartSay()==null || user.getHeartSay().equals("")){
			Region r = regionService.getRegion(user);
			request.setAttribute("region", r);
			List<Heartsay> hsl = heartSayService.getXlHeartsayList(user);
			request.setAttribute("hsl", hsl);
			List<User> userlist = userService.getOnlineUser(user);
			request.setAttribute("userlist", userlist);
			page="/regsuccess";
			
		}else if (action.equals("myhome")) {
	
			
				Region r = regionService.getRegion(user);
				request.setAttribute("region", r);
				page = "/home_my";
			
			
		} else if (action.equals("basic_info")) {
			page = "/basic_info";
		} else if (action.equals("more_info")) {
			List<PeopleType> pt = peopleTypeService.getPeopleType(user);
			List<Interest> it = InterestService.getInterestList(user);
			List<PeopleChar> ct = peopleCharService.getPeopleChar(user);
			List<Interest> it2 = new ArrayList<Interest>();
			List<PeopleChar> ct2 = new ArrayList<PeopleChar>();
			if(user.getUserinfoMore()!=null){
				String hobbies = user.getUserinfoMore().getHobbies();
				for (int i = 0; i < it.size(); i++) {
					Interest xit = it.get(i);
					if (hobbies != null && !hobbies.equals("")) {
						String[] hobbiess = hobbies.split(",");
						for (int j = 0; j < hobbiess.length; j++) {
							if (hobbiess[j].equals(xit.getId().toString())) {
								xit.setFlag(1);
							}
						}

					}
					it2.add(xit);
				}
			}else{
				it2 =it;
			}
		if(user.getUserinfoMore()!=null){
			String personalType = user.getUserinfoMore()
					.getPersonalType();
			for (int i = 0; i < ct.size(); i++) {
				PeopleChar xct = ct.get(i);
				if (personalType != null && !personalType.equals("")) {
					String[] personalTypes = personalType.split(",");
					for (int j = 0; j < personalTypes.length; j++) {
						if (personalTypes[j].equals(xct.getId()
								.toString())) {
							xct.setFlag(1);
						}
					}

				}
				ct2.add(xct);
			}	
		}else{
			ct2 = ct;
		}

		

			request.setAttribute("pt", pt);
			request.setAttribute("it", it2);
			request.setAttribute("ct", ct2);
			page = "/more_info";
		} else if (action.equals("match")) {
			List<Region> list = regionService.getRegion_pro();
			request.setAttribute("region", list);
			Region r = regionService.getMatchRegion(user);
			request.setAttribute("ur", r);
              page="/match";
		} else if (action.equals("userlist")) {
			String offset = request.getParameter("offset");
			int intoffset = 0;
			if(offset!=null && !offset.equals("")){
				intoffset = Integer.parseInt(offset);
			}
			request.setAttribute("offset", intoffset);
			List<User> userlist = userService.getMatchUser(user,intoffset,4);
			List<User> userlist2 = new ArrayList<User>();
			for (int i = 0; i <userlist.size(); i++) {
				User usermatch = userlist.get(i);
				if(usermatch.getUserinfoMore()!=null){
				   usermatch.setPeopleCharList(peopleCharService.getPeopleChar(usermatch.getUserinfoMore().getPersonalType()));	
				   usermatch.setInterestList(InterestService.getInterestList(usermatch.getUserinfoMore().getHobbies()));
				}
				userlist2.add(usermatch);
			}
			
			request.setAttribute("ul", userlist2);
			Region r = regionService.getRegion(user);
			request.setAttribute("region", r);
			List<Region> list = regionService.getRegion_pro();
			request.setAttribute("regionpro", list);
			
              page="/userlist";
		}else if(action.equals("userinfo")){
			String matchid = request.getParameter("matchid");
			
			   User matchuser = userService.getUserByid(matchid);
		    request.setAttribute("matchuser", matchuser);
			Region r = regionService.getRegion(user);
			request.setAttribute("region", r);
			List<PeopleType> pt = peopleTypeService.getPeopleType(user);
			request.setAttribute("pt", pt);
			List<PeopleChar> chlist= new ArrayList<PeopleChar>();	
			List<Interest> inlist=new ArrayList<Interest>();
			if(user.getUserinfoMore()!=null){
			 chlist= peopleCharService.getPeopleChar(user.getUserinfoMore().getPersonalType());	
			 inlist=InterestService.getInterestList(user.getUserinfoMore().getHobbies());
			}

			request.setAttribute("chlist", chlist);
			request.setAttribute("inlist", inlist);
			System.out.println("photos:"+user.getXlPhotos().size());
			
			page = "/userinfo";
		} else if(action.equals("chatlist")){
			
			
			page = "/chatlist";
		} else if(action.equals("chat")){
			
			String matchid = request.getParameter("matchid");
			  User matchuser = userService.getUserByid(matchid);
			    request.setAttribute("matchuser", matchuser);
			    Region r = regionService.getRegion(matchuser);
				request.setAttribute("region", r);
		
			String cid = request.getParameter("cid");
			chatService.setReaded(cid);
			page = "/dialogue";
		} else if(action.equals("locationlist")){
			
			page = "/locationlist";
		} else if(action.equals("myalbum")){
			String pid = request.getParameter("pid");
			request.setAttribute("pid", pid);
			String view = request.getParameter("view");
			if(view.equals("match")){
				String matchid = request.getParameter("matchid");
				  User matchuser = userService.getUserByid(matchid);
				    request.setAttribute("matchuser", matchuser);
			}else{
				 request.setAttribute("matchuser", user);
			}
		
			page = "/user_album";
		}else if(action.equals("myphoto")){
			page = "/photo_upload";
		}else if(action.equals("heartsay")){
			page = "/heartsay";
		}else {
			page = "/home_my";
		}
		return page;
	}
	@RequestMapping(value="/uploadphoto")
    public String douploadphpto( HttpServletResponse response, HttpServletRequest request){
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String openid = request.getParameter("openid");
		System.out.println("openid:"+openid);
		String istx = request.getParameter("istx");
		System.out.println("istx:"+istx);
		String filesize=null;
		String savePath = request.getServletContext().getRealPath("");
		savePath = savePath + "/resources/user_img/"+openid+"/";
		File temp = new File(savePath);
		if(!temp.exists())
			temp.mkdirs();
		DiskFileItemFactory fac = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(fac);
		upload.setHeaderEncoding("utf-8");
		try{
		List filelist = upload.parseRequest(request);
		for (Iterator it = filelist.iterator(); it.hasNext();) {
			//�W��
			FileItem item = (FileItem) it.next();
			if (!item.isFormField()) {
				 //filename= ("photobook"+OpreateFile.createtFileName(item.getName()));
				System.out.println("item.getName():"+item.getName());
				String pattern="";
				if(item.getName().indexOf(".")!=-1){
					 pattern = item.getName().substring(item.getName().lastIndexOf("."));
				}else{
					pattern=".jpg";
				}
				
				// filesize=changeSize(item.getSize());
				 System.out.println("filesize:"+item.getSize());
				 if(item.getSize()>0){
					 String fname = new Date().getTime()+pattern;
					 String fn = savePath+"/"+fname;
					 System.out.println(fn);
					File file = new File(fn);
					item.write(file);
//					BufferedImage sourceImg =ImageIO.read(new FileInputStream(file));   
//			        System.out.println(sourceImg.getWidth());  
//			        System.out.println(sourceImg.getHeight());  
//					System.out.println( openid+pattern );
//					//System.out.println("<br>..>>"+filename+">>>>"+filesize+"|"+str);
//					int sw=sourceImg.getWidth();
//					int sh=sourceImg.getHeight();
//					if(sw>sh){
//						if(sw>100){
//							sh = 100*sh/sw;
//							sw=100;
//						}
//					}else if(sh>sw){
//						if(sh>100){
//							sw=sw*100/sh;
//							sh=100;
//						}
//					}else {
//						sw=100;
//						sh=100;
//					}
					User user =  (User) request.getSession().getAttribute("sessionuser");
				    if(istx!=null && istx.equals("1")){
				    	userService.settx(user, "../resources/user_img/"+openid+"/"+fname);
				    }else{
				    	
				    	photoService.savePhotos(user, "../resources/user_img/"+openid+"/"+fname);
				    }
				    out.write("success"+","+"../resources/user_img/"+openid+"/"+fname); 
				 }else{
					 out.write("error_no_tishi");
				 }
			
		}
			}
		//System.out.println("----------------------------");
		}catch(Exception e){
			out.write("error");
			e.printStackTrace();
		}
		out.close();
		return null;
	}
	@RequestMapping(value="/ViewWedding")
    public String ViewWedding( HttpServletResponse response, HttpServletRequest request){
		
//		String action = request.getParameter("action");
//		User user = (User) request.getSession().getAttribute("sessionuser");
//		if(user.getIsweixinuser()==0){
//			userService.updateLogintime(user);   //更新登录时间
//		}
//		request.setAttribute("user", user);
		return "/wedding/ourwedding";
	}
}
