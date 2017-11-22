package com.hk.lab5.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceImpl implements IService {

	@Autowired
	private IDao dao;

}




