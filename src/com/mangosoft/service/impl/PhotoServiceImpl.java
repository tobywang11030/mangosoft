package com.mangosoft.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mangosoft.dao.photo.PhotoDao;
import com.mangosoft.service.PhotoService;
import com.mangosoft.vo.Photo;
import com.mangosoft.vo.User;
@Service
public class PhotoServiceImpl implements PhotoService {
    private PhotoDao photoDao;
    @Resource(type = PhotoDao.class)
    public void setPhotoDao(PhotoDao photoDao){
    	this.photoDao = photoDao;
    }
	@Override
	public void savePhotos(User user,String path) {
		// TODO Auto-generated method stub
      Photo photo = new Photo();
      photo.setUid(user);
      photo.setSrc(path);
      photoDao.save(photo);
      
	}

}
