package com.kh17.panda.service;


import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh17.panda.entity.FilesDto;
import com.kh17.panda.entity.ProductDto;
import com.kh17.panda.entity.SizesDto;
import com.kh17.panda.repository.FilesDao;
import com.kh17.panda.repository.ProductDao;
import com.kh17.panda.repository.SizesDao;
import com.kh17.panda.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private SizesDao sizesDao;
	
	@Autowired
	private FilesDao filesDao;
	
	@Override
	@Transactional
	public int regist(ProductVO vo) throws IllegalStateException, IOException {
		int id = productDao.getSequenceNumber();
		
		//메인 이미지 등록 (물리 저장소 저장 -> DB 저장)
		int main_id = filesDao.getSequenceNumber();
		
		File f1 = new File("D:/upload/kh17/product", id + "-main." + FilenameUtils.getExtension(vo.getMain().getOriginalFilename()));
		vo.getMain().transferTo(f1);
		
		FilesDto filesDto = FilesDto.builder()
												.id(main_id)
												.savename(f1.getName())
												.uploadname(vo.getMain().getOriginalFilename())
												.len(vo.getMain().getSize())
												.type(vo.getMain().getContentType())
											.build();											
		
		filesDao.insert(filesDto);
		
		//상세 이미지 등록 (물리 저장소 저장 -> DB 저장)
		int details_id = filesDao.getSequenceNumber();
		
		File f2 = new File("D:/upload/kh17/product", id + "-details." + FilenameUtils.getExtension(vo.getDetails().getOriginalFilename()));
		vo.getDetails().transferTo(f2);
		
		filesDto = FilesDto.builder()
									.id(details_id)
									.savename(f2.getName())
									.uploadname(vo.getDetails().getOriginalFilename())
									.len(vo.getDetails().getSize())
									.type(vo.getDetails().getContentType())
								.build();											

		filesDao.insert(filesDto);
		
		ProductDto productDto = ProductDto.builder()
														.id(id)
														.seller_id(vo.getSeller_id())
														.sub_category_id(vo.getSub_category_id())
														.name(vo.getName())
														.price(vo.getPrice())
														.sale_yn(vo.getSale_yn())
														.hit_yn(vo.getHit_yn())
														.display_yn(vo.getDisplay_yn())
														.mainfile(main_id)
														.detailfile(details_id)
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
	public void edit(ProductVO vo) throws IllegalStateException, IOException {
		int id = vo.getId();
		ProductDto productDto = new ProductDto();
		
		//메인 이미지 신규 파일이 있다면 (안 비어있다면)
		if(!vo.getMain().isEmpty()) {
			//기존 파일이 있다면
			if(vo.getMainfile() != 0) {
				//먼저 삭제를 한다
				String savename = filesDao.getSaveName(vo.getMainfile());
				File file = new File("D:/upload/kh17/product", savename);
				file.delete();
				filesDao.delete(vo.getMainfile());
			}
			//메인 이미지 등록 (물리 저장소 저장 -> DB 저장)
			int main_id = filesDao.getSequenceNumber();
			
			File f1 = new File("D:/upload/kh17/product", id + "-main." + FilenameUtils.getExtension(vo.getMain().getOriginalFilename()));
			vo.getMain().transferTo(f1);
			
			FilesDto filesDto = FilesDto.builder()
													.id(main_id)
													.savename(f1.getName())
													.uploadname(vo.getMain().getOriginalFilename())
													.len(vo.getMain().getSize())
													.type(vo.getMain().getContentType())
												.build();	
			
			filesDao.insert(filesDto);	
			productDto.setMainfile(main_id);
		}
		
		//상세 이미지 신규 파일이 있다면 (안 비어있다면)
		if(!vo.getDetails().isEmpty()) {
			//기존 파일이 있다면
			if(vo.getDetailfile() != 0) {
				//먼저 삭제를 한다
				String savename = filesDao.getSaveName(vo.getDetailfile());
				File file = new File("D:/upload/kh17/product", savename);
				file.delete();
				filesDao.delete(vo.getDetailfile());
			}
			//상세 이미지 등록 (물리 저장소 저장 -> DB 저장)
			int details_id = filesDao.getSequenceNumber();
			
			File f2 = new File("D:/upload/kh17/product", id + "-details." + FilenameUtils.getExtension(vo.getDetails().getOriginalFilename()));
			vo.getDetails().transferTo(f2);
			
			FilesDto filesDto = FilesDto.builder()
										.id(details_id)
										.savename(f2.getName())
										.uploadname(vo.getDetails().getOriginalFilename())
										.len(vo.getDetails().getSize())
										.type(vo.getDetails().getContentType())
									.build();

			filesDao.insert(filesDto);
			productDto.setDetailfile(details_id);
		}
		
		System.out.println(vo.getMainfile());
		System.out.println(vo.getDetailfile());
		 			productDto = ProductDto.builder()
														.id(vo.getId())
														.name(vo.getName())
														.price(vo.getPrice())
														.sale_yn(vo.getSale_yn())
														.hit_yn(vo.getHit_yn())
														.display_yn(vo.getDisplay_yn())
//														.mainfile(main_id)
//														.detailfile(details_id)
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
