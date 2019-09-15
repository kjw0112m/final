package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.TotalDto;

public interface TotalDao {
	
	List<TotalDto> seller(String type, String keyword);
}
