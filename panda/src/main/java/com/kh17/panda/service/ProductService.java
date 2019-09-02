package com.kh17.panda.service;

import java.io.IOException;

import com.kh17.panda.vo.ProductVO;

public interface ProductService {
	int regist(ProductVO vo) throws IllegalStateException, IOException;
	void edit(ProductVO vo);
}
