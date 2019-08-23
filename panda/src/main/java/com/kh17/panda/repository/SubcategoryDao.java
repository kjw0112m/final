package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.SubcategoryDto;

public interface SubcategoryDao {
	List<SubcategoryDto> list();
	String get(int sub_category_id);
	SubcategoryDto getDto(int sub_category_id);
}
