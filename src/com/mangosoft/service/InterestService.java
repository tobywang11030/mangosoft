package com.mangosoft.service;

import java.util.List;

import com.mangosoft.vo.Interest;
import com.mangosoft.vo.User;



public interface InterestService {
   public List<Interest> getInterestList(User user);
   public List<Interest> getInterestList(String ids);
}
