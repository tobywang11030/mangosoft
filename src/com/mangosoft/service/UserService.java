package com.mangosoft.service;



import java.util.List;









import com.mangosoft.vo.User;



public interface UserService {
	  public User getUser(String openid);
	  public User getUserByid(String id);
	  public void addUser(User user);
	  public void setUserAge(User user,String age);
	  public void setUserBasic(User user,String nick_name,String year,String month,String day,String height,String province,String city,String weight,String blood_type,String edu,String work,String income,String marry_type,String have_house);
	  public void setUserMoreInfo(User user,String need_baby,String diff_area_love,String lover_type,String sex_first,String live_with_parent,String charm,String characteristic,String interest);
	  public void setUserMatch(User user,String con_age_min,String con_age_max,String con_height_min,String con_height_max,String con_income,String con_province,String con_edu);
	  public void setUserheartsay(User user,String heartsay);
	  public  List<User> getOnlineUser(User user);  //注册成功后打招呼
	  public List<User> getMatchUser(User user,int offset,int size);      //缘分天空列表
	  public List<User> getWeixinUser();        //获得所有在线微信用户，检查其状态
	  public void updateLogintime(User user);     //更新用户登录时间
	  public void updateUserstate(User user,int state);     //更新用户状态
	  public void settx(User user,String path);    //设置头像
}
