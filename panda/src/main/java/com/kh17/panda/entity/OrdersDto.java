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
	private String member_id,order_dt,status,cs_status,pay_type, order_id, t_invoice, t_id, sizes, team;
	private int id,product_id,quantity,total_price,discount_price;

}
