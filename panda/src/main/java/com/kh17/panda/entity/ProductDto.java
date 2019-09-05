package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ProductDto {
	private int id;
	private String seller_id;
	private int sub_category_id;
	private String name;
	private int price;
	private int dis_rate;
	private String regist_dt;
	private String sale_yn;//n
	private String hit_yn;//n
	private String display_yn;//n
	private int mainfile;
	private int detailfile;
}
