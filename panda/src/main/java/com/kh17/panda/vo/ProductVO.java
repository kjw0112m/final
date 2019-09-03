package com.kh17.panda.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data @Builder @NoArgsConstructor @AllArgsConstructor
public class ProductVO {
	int id, sub_category_id, price, mainfile, detailfile;
	String seller_id, name, sale_yn, hit_yn, display_yn;
	MultipartFile main, details;
	List<String> sizes;
}
