package com.mangosoft.vo;

import java.sql.Timestamp;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * XlChat entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "xl_chat", catalog = "ai_alice")
public class Chat implements java.io.Serializable {



	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private User xlUserByChatTo;
	private User xlUserByChatFrom;
	private String chatContent;
	private Timestamp sendtime;
	private Integer readed;

	// Constructors

	/** default constructor */
	public Chat() {
	}

	/** minimal constructor */
	public Chat(User xlUserByChatTo, User xlUserByChatFrom) {
		this.xlUserByChatTo = xlUserByChatTo;
		this.xlUserByChatFrom = xlUserByChatFrom;
	}

	/** full constructor */
	public Chat(User xlUserByChatTo, User xlUserByChatFrom,
			String chatContent, Timestamp sendtime, Integer readed) {
		this.xlUserByChatTo = xlUserByChatTo;
		this.xlUserByChatFrom = xlUserByChatFrom;
		this.chatContent = chatContent;
		this.sendtime = sendtime;
		this.readed = readed;
	}

	// Property accessors
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "chat_to", nullable = false)
	public User getXlUserByChatTo() {
		return this.xlUserByChatTo;
	}

	public void setXlUserByChatTo(User xlUserByChatTo) {
		this.xlUserByChatTo = xlUserByChatTo;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "chat_from", nullable = false)
	public User getXlUserByChatFrom() {
		return this.xlUserByChatFrom;
	}

	public void setXlUserByChatFrom(User xlUserByChatFrom) {
		this.xlUserByChatFrom = xlUserByChatFrom;
	}

	@Column(name = "chat_content", length = 50)
	public String getChatContent() {
		return this.chatContent;
	}

	public void setChatContent(String chatContent) {
		this.chatContent = chatContent;
	}

	@Column(name = "sendtime", length = 19)
	public Timestamp getSendtime() {
		return this.sendtime;
	}

	public void setSendtime(Timestamp sendtime) {
		this.sendtime = sendtime;
	}

	@Column(name = "readed")
	public Integer getReaded() {
		return this.readed;
	}

	public void setReaded(Integer readed) {
		this.readed = readed;
	}

}