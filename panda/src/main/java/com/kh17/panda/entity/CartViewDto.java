package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Data
public class CartViewDto {
	private int cart_id, product_price, quantity;
	private String product_seller_id, product_name, sizes, member_id;
}
