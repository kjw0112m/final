package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@Builder@AllArgsConstructor@NoArgsConstructor
public class NoticeDto {
  
	private int id;
	private String title;
	private String content;
	private String createdate;
	private String createUser;
	private int readCount;
	private int rn;
	private String mode;
	private String commentcontent;

}
