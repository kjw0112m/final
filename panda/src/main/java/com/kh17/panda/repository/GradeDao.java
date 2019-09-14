package com.kh17.panda.repository;

import java.util.List;

import com.kh17.panda.entity.GradeDto;

public interface GradeDao {
	public GradeDto get(int id);

	void rate(GradeDto gradeDto);

	public List<GradeDto> all();

}
