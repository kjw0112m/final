package com.kh17.panda.repository;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.ReviewDto;
@Repository
public class ReviewDaoImpl implements ReviewDao{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertReviewComment(ReviewDto reviewDto) {
		sqlSession.insert("review.insertReviewComment",reviewDto);
	}

	@Override
	public List<ReviewDto> listReviewComment(ReviewDto reviewDto) {
		return sqlSession.selectList("review.listReviewComment",reviewDto);
	}

	@Override
	public void updateComment(ReviewDto reviewDto) {
		sqlSession.update("review.updateComment",reviewDto);
	}

	@Override
	public void delComment(ReviewDto reviewDto) {
		sqlSession.delete("review.delComment",reviewDto);
	}

	@Override
	public ReviewDto getstartotalcnt(ReviewDto reviewDto) {
		return sqlSession.selectOne("review.getstartotalcnt", reviewDto);
	}

	
	
	
	
	@Override
	public void ainsertReviewComment(ReviewDto reviewDto) {
		sqlSession.insert("review.ainsertReviewComment",reviewDto);
		
	}

	
	
	

		
		
		
	}

	

