package com.mangosoft.service;

import java.util.List;



import com.mangosoft.vo.Chat;
import com.mangosoft.vo.User;


public interface ChatService {
    public Chat saysomthing(User userfrom,User userto,String content);
    public List<Chat> getChatList(User user,int offset, int size);
    public List<Chat> getChat(String id, String toid);
    public void setReaded(String cid);
}
