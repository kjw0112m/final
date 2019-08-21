package com.kh17.panda.service;

import com.kh17.panda.vo.ProductVO;

public interface ProductService {
	int regist(ProductVO vo);
	void edit(ProductVO vo);
}
