package com.kh17.panda.vo;

import com.kh17.panda.entity.ProductDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder @NoArgsConstructor @AllArgsConstructor @Data
public class OrderVO {
	private ProductDto productDto;
	private int quantity;
	private String size;
}
