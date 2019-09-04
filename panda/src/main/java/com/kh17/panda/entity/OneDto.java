package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data@Builder@AllArgsConstructor@NoArgsConstructor
public class OneDto {
  
	private int id;
	private String title;
	private String content;
	private String updatedate;
	private String createuser;
	private int rn;
	private String mode;
	private String memberid;
	private String state;
	private String product;
	private String onecomment;
	private String onecommentdate;
	private String onecommentuser;

}
