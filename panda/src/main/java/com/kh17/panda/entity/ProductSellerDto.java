package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ProductSellerDto {
	private String seller_id, seller_name, nickname, product_name, regist_dt, sale_yn, hit_yn, display_yn;
	private int product_id, sub_category_id, price, dis_rate;
}
