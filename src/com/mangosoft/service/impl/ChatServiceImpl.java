package com.mangosoft.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;





import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.mangosoft.dao.chat.ChatDao;
import com.mangosoft.service.ChatService;
import com.mangosoft.vo.Chat;
import com.mangosoft.vo.User;
@Service
public class ChatServiceImpl implements ChatService {
    private ChatDao chatDao;
    @Resource(type=ChatDao.class)
    public void setChatDao(ChatDao chatDao){
    this.chatDao = chatDao;	
    }
	@Override
	public Chat saysomthing(User userfrom, User userto, String content) {
		// TODO Auto-generated method stub
		Chat chat = new Chat();
		chat.setXlUserByChatFrom(userfrom);
		chat.setXlUserByChatTo(userto);
		chat.setChatContent(content);
    	chat.setSendtime(new Timestamp(new Date().getTime()));
    	chat.setReaded(0);
    	chatDao.save(chat);
    	return chat;
	}
	@Override
	public List<Chat> getChatList(User user, int offset, int size) {
		// TODO Auto-generated method stub
		offset = offset*size;
		String wheresql = " and xlUserByChatTo =? ";
		Object[] queryParams = new Object[]{user};
		LinkedHashMap<String, Object> orderby = new LinkedHashMap<String, Object>();
		orderby.put("sendtime", "desc");
		List<Chat> chatlist = new ArrayList<Chat>();
		chatlist = chatDao.limitFindByHql(offset, size, wheresql, queryParams, orderby);
		for ( int i = 0 ; i < chatlist.size() - 1 ; i ++ ) {
		     for ( int j = chatlist.size() - 1 ; j > i; j -- ) {
		       if (chatlist.get(j).getXlUserByChatFrom().getId()==chatlist.get(i).getXlUserByChatFrom().getId()) {
		    	   chatlist.remove(j);
		       }
		      }
		    }
		return chatlist;
	}
	@Override
	public List<Chat> getChat(String id, String toid) {
		// TODO Auto-generated method stub
		String hql = "from Chat where (xlUserByChatTo.id="+id+" and xlUserByChatFrom.id="+toid+") or (xlUserByChatTo.id="+toid+" and xlUserByChatFrom.id="+id+")";
		
		return chatDao.findTbyHql(hql);
	}
	@Override
	public void setReaded(String cid) {
		// TODO Auto-generated method stub
		Chat chat = chatDao.get(Integer.parseInt(cid));
		chat.setReaded(1);
		chatDao.update(chat);
	}

}
