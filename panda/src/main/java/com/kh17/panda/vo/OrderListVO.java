package com.kh17.panda.vo;

import java.util.List;

import com.kh17.panda.entity.OrderViewDto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class OrderListVO {
	private String team;
	private List<OrderViewDto> list;
}
