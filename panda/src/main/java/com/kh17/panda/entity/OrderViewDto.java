package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

//회원 + 주문 + 상품
@Builder @NoArgsConstructor @AllArgsConstructor @Data
public class OrderViewDto {
	private String product_name, seller_id, cs_status, t_status, pay_status, member_id, member_name, t_id;
	private String order_dt, order_id, pay_type, t_invoice, team, re_addr, detail_addr, basic_addr, post_code;
	private String re_name, re_phone, sizes, phone;
	private String start_dt, end_dt;
	private String nickname;
	
	private int total_price, discount_price, price, quantity;
	
	public String getDate() {
		return order_dt.substring(0, 10);
	}
	
	public String getTime() {
		return order_dt.substring(0, 19);
	}
	
	public String getAddr() {
		return "["+post_code+"]"+basic_addr+" "+detail_addr;
	}
}
