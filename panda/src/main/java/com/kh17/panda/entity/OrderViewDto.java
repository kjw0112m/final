package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder @NoArgsConstructor @AllArgsConstructor @Data
public class OrderViewDto {
	private String product_name, seller_id, cs_status, status, member_id;
	private String order_dt, order_id, pay_type, t_invoice, team, basic_addr, detail_addr;
	private String member_name, phone, sizes;
	
	private String start_dt, end_dt;
}
