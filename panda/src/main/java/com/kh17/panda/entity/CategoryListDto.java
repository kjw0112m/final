package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class CategoryListDto {
	private int category_id, sub_category_id, product_id, price, dis_rate, mainfile, detailfile;
	private String category_name, sub_category_name, product_name, product_regist_dt, sale_yn, hit_yn, display_yn, seller_id, seller_name, nickname, seller_regist_dt;
}
