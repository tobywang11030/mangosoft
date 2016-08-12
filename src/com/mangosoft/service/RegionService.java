package com.mangosoft.service;

import java.util.List;



import com.mangosoft.vo.Region;
import com.mangosoft.vo.User;



public interface RegionService {
	 public List<Region> getRegion_pro();
	 public List<Region> getRegion_city(String pid);
	 public Region getRegion(User user);
	 public Region getMatchRegion(User user);
	
}
