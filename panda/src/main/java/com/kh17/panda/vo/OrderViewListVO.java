package com.kh17.panda.vo;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Builder @NoArgsConstructor @AllArgsConstructor @Data
public class OrderViewListVO {
	List<OrderViewVO> search = new ArrayList<>();
}
