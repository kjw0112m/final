package com.kh17.panda.repository;

import com.kh17.panda.entity.CertDto;

public interface CertDao {
	void insert(CertDto certDto);
	boolean validate(CertDto certDto);
	void delete(CertDto certDto);
	void clear();
}
