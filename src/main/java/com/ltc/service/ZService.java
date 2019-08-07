package com.ltc.service;

import java.util.List;

import com.ltc.domain.Types;
import com.ltc.domain.ZW;

/**
 * 
 * @author 成爹
 *
 */
public interface ZService {
	
	//列表
	List<ZW> list(ZW z,Integer page,Integer rows);
	
	//计数
	int count(ZW z);
	
	//查另一张表
	List<Types> getlist();
	
	//添加
	int add(ZW z);
	
	//删除
	int del(Integer id);
	
	//修改
	boolean update(ZW z);
	
	//单查
	ZW getbyid(Integer id);
	
	
}
