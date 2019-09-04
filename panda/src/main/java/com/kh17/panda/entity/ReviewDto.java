package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@Builder@AllArgsConstructor@NoArgsConstructor
public class ReviewDto {
  
	private int id;
	private String title;
	private String content;
	private String registdt;
	private String createuser;
	private int readCount;
	private int rn;
	private int starcnt;
	private String ordersid;
	private String commentcontent;
	private int commentstar;
	private String startotalcnt;
	
}
