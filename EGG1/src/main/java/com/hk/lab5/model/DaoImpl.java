package com.hk.lab5.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoImpl implements IDao {

	private final String NAMESPACE = "";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
}
