package com.mangosoft.service;

import java.util.List;

import com.mangosoft.vo.PeopleChar;
import com.mangosoft.vo.User;

public interface PeopleCharService {
   public List<PeopleChar> getPeopleChar(User user);
   public List<PeopleChar> getPeopleChar(String ids);
}
