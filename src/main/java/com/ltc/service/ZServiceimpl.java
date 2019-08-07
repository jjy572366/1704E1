package com.ltc.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ltc.dao.ZDao;
import com.ltc.domain.Types;
import com.ltc.domain.ZW;

@Service
public class ZServiceimpl implements ZService {

	@Resource
	private ZDao dao;
	@Override
	public List<ZW> list(ZW z,Integer page,Integer rows) {
		// TODO Auto-generated method stub
		return dao.list(z,page,rows);
	}
	@Override
	public int count(ZW z) {
		// TODO Auto-generated method stub
		return dao.count(z);
	}
	@Override
	public List<Types> getlist() {
		// TODO Auto-generated method stub
		return dao.getlist();
	}
	@Override
	public int add(ZW z) {
		// TODO Auto-generated method stub
		return dao.add(z);
	}
	@Override
	public int del(Integer id) {
		// TODO Auto-generated method stub
		return dao.del(id);
	}
	@Override
	public boolean update(ZW z) {
		try {
			dao.update(z);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return false;
		
	}
	@Override
	public ZW getbyid(Integer id) {
		// TODO Auto-generated method stub
		return dao.getbyid(id);
	}

}
