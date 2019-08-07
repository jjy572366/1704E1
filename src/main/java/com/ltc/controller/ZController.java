package com.ltc.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ltc.domain.Types;
import com.ltc.domain.ZW;
import com.ltc.service.ZService;

@Controller
public class ZController {

	@Resource
	private ZService service;
	
	//列表  模糊  分页
	@RequestMapping("list")
	public String list(Model model,ZW z,@RequestParam(defaultValue="1")Integer page,@RequestParam(defaultValue="3")Integer rows){
		int total = service.count(z);
		int pages = total%rows ==0?total/rows:total/rows+1;
		List<ZW> list = service.list(z,(page-1)*rows,rows);
		model.addAttribute("list", list);
		model.addAttribute("z", z);
		model.addAttribute("pages", pages);
		model.addAttribute("page", page);
		return "list";
	}
	
	//令一张表
	@ResponseBody
	@RequestMapping("getlist")
	public List<Types> getlist(){
		List<Types> list = service.getlist();
		return list;
	}
	
	//去添加
	@RequestMapping("toadd")
	public String toadd(){
		return "add";
	}
	
	//添加
	@ResponseBody
	@RequestMapping("add")
	public boolean add(ZW z){
		return service.add(z)>0;
	}
	
	//删除
	@ResponseBody
	@RequestMapping("del")
	public boolean del(Integer id){
		return service.del(id)>0;
	}
	
	//去修改
	@RequestMapping("toupdate")
	public String toupdate(Model model,Integer id){
		ZW zw = service.getbyid(id);
		model.addAttribute("zw", zw);
		return "update";
	}
	//修改
	@ResponseBody
	@RequestMapping("update")
	public boolean update(ZW z){
		return service.update(z);
	}
	

}
