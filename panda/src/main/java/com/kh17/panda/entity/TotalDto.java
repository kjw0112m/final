package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class TotalDto {
	private String seller_id, nickname, email, phone;
	private String product_name, seller_name;
	private int product_price, product_id, proceeds, total_price;
	private String pay_status, order_dt, find_dt;
	private int quantity;
}
