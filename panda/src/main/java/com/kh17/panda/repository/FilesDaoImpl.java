package com.kh17.panda.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh17.panda.entity.FilesDto;

@Repository
public class FilesDaoImpl implements FilesDao{
	@Autowired
	SqlSession sqlSession;

	@Override
	public int getSequenceNumber() {
		return sqlSession.selectOne("files.seq");
	}

	@Override
	public void insert(FilesDto filesDto) {
		sqlSession.insert("files.insert", filesDto);
	}

	@Override
	public FilesDto get(int id) {
		return sqlSession.selectOne("files.get", id);
	}

	@Override
	public String getSaveName(int id) {
		return sqlSession.selectOne("files.getSaveName", id);
	}

	@Override
	public void delete(int id) {
		sqlSession.delete("files.delete", id);
	}
	
	
}
