package com.kh17.panda.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.GradeDto;

@Repository
public class GradeDaoImpl implements GradeDao{
	@Autowired
	SqlSession sqlSession;

	@Override
	public GradeDto get(int id) {
		return sqlSession.selectOne("grade.get", id);
	}
	
	@Override
	public void rate(GradeDto gradeDto) {
		sqlSession.update("grade.rate", gradeDto);
	}

	@Override
	public List<GradeDto> all() {
		return sqlSession.selectList("grade.all");
	}
	
}
