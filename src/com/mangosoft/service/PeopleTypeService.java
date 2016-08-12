package com.mangosoft.service;

import java.util.List;

import com.mangosoft.vo.PeopleType;
import com.mangosoft.vo.User;


public interface PeopleTypeService {
	 public List<PeopleType> getPeopleType(User user);
}
