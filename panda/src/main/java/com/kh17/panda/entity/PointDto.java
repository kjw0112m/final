package com.kh17.panda.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @AllArgsConstructor @NoArgsConstructor
public class PointDto {
	private int id, use_point, current_point;
	private String content, member_id, when, type, team;
	
	public String getDate() {
		return when.substring(0, 10);
	}
}
