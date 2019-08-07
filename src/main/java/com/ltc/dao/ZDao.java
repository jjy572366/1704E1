package com.ltc.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ltc.domain.Types;
import com.ltc.domain.ZW;

public interface ZDao {

	//列表
	List<ZW> list(@Param("z")ZW z,@Param("page")Integer page,@Param("rows")Integer rwos);
	
	//计数
	int count(@Param("z")ZW z);
	
	//查另一张表
	List<Types> getlist();
	
	//添加
	int add(ZW z);
	
	//删除
	int del(Integer id);
	
	//修改
	int update(ZW z);
	
	//单查
	ZW getbyid(Integer id);
	
	
}
