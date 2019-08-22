package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.SizesDto;

public interface SizesDao {

	void regist(SizesDto sizesDto);
	List<String> get(int id);
	void edit(SizesDto sizesDto);

}
