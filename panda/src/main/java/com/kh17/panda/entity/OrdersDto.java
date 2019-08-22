package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Builder
@Data
public class OrdersDto {
	private String order_id, member_id, order_dt, pay_type, status, cs_status;
	private int id, product_id, quantity, total_price, discount_price, team;
}
