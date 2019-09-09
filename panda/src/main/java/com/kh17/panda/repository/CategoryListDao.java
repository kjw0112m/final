package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.CategoryListDto;

public interface CategoryListDao {

	List<CategoryListDto> list(int category_id, int start, int end);
	int count(int category_id);

}
