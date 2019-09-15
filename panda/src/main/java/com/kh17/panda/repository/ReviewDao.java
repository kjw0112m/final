package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.NoticeDto;
import com.kh17.panda.entity.OneDto;
import com.kh17.panda.entity.ReviewDto;

public interface ReviewDao {
	void insertReviewComment(ReviewDto reviewDto);
	
	void ainsertReviewComment(ReviewDto reviewDto);
	
	List<ReviewDto> listReviewComment(ReviewDto reviewDto);
	void updateComment(ReviewDto reviewDto);
	void delComment(ReviewDto reviewDto);
	ReviewDto getstartotalcnt(ReviewDto reviewDto);
}
