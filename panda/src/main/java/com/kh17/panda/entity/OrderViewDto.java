package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//회원 + 주문 + 상품
@Builder @NoArgsConstructor @AllArgsConstructor @Data
public class OrderViewDto {
	private String product_name, seller_id, cs_status, t_status, pay_status, member_id;
	private String order_dt, order_id, pay_type, t_invoice, team, re_addr;
	private String re_name, re_phone, sizes;
	private String start_dt, end_dt;
	
	private int total_price, discount_price, price, quantity;
	
	public String getDate() {
		return order_dt.substring(0, 10);
	}
}
