package com.mangosoft.service;

import java.util.List;

import com.mangosoft.vo.Heartsay;
import com.mangosoft.vo.User;


public interface HeartSayService {
	  public  List<Heartsay> getXlHeartsayList(User user);
}
