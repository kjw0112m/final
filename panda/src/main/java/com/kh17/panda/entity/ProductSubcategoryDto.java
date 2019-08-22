package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class ProductSubcategoryDto {
	int subcategory_id, category_id, product_id, price, dis_rate;
	String subcategory_name, seller_id, product_name, regist_dt, sale_yn, hit_yn, display_yn, category_name;
}
