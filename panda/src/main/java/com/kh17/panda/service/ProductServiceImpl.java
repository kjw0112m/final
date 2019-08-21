package com.kh17.panda.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh17.panda.entity.ProductDto;
import com.kh17.panda.entity.SizesDto;
import com.kh17.panda.repository.ProductDao;
import com.kh17.panda.repository.SizesDao;
import com.kh17.panda.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private SizesDao sizesDao;
	
	@Override
	@Transactional
	public int regist(ProductVO vo) {
		int id = productDao.getSequenceNumber();
		ProductDto productDto = ProductDto.builder()
														.id(id)
														.seller_id(vo.getSeller_id())
														.sub_category_id(vo.getSub_category_id())
														.name(vo.getName())
														.price(vo.getPrice())
														.sale_yn(vo.getSale_yn())
														.hit_yn(vo.getHit_yn())
														.display_yn(vo.getDisplay_yn())
														.build();
		
		productDao.insert(productDto);
		
		//vo에 들어있는 sizes를 분해
		for(int i = 0; i < vo.getSizes().size(); i++) {
			String sizes = vo.getSizes().get(i);
			String[] part = sizes.split("-");
			
			SizesDto sizesDto = SizesDto.builder()
					.product_id(id)
					.sizes(part[0])
					.quantity(Integer.parseInt(part[1]))
					.build();
			sizesDao.regist(sizesDto);			
		}
		
		return id;
	}

	@Override
	@Transactional
	public void edit(ProductVO vo) {
		ProductDto productDto = ProductDto.builder()
														.id(vo.getId())
														.price(vo.getPrice())
														.sale_yn(vo.getSale_yn())
														.hit_yn(vo.getHit_yn())
														.display_yn(vo.getDisplay_yn())
														.build();

		productDao.edit(productDto);

		//vo에 들어있는 sizes를 분해
		for(int i = 0; i < vo.getSizes().size(); i++) {
			String sizes = vo.getSizes().get(i);
			System.out.println(sizes);
			String[] part = sizes.split("-");

			SizesDto sizesDto = SizesDto.builder()
														.product_id(vo.getId())
														.sizes(part[0])
														.quantity(Integer.parseInt(part[1]))
														.build();
			sizesDao.edit(sizesDto);			
		}
		
	}
	
}
