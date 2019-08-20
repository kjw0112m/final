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
	private String memberId,orderDt,status,csStatus,payType;
	private int id,productId,quantity,totalPrice,discountPrice,team;

}
