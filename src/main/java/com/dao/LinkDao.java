package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.LinkBean;
import java.util.List;
@Repository
public class LinkDao{

	@Autowired
	JdbcTemplate smt;
	
	public int updateLinks(LinkBean link)
	{
		int i = 0;
		try {
			i = smt.update("update linktable set seminarlink = ?, counsellinglink = ?",link.getSeminarLink(),link.getCounsellingLink());
			i = 1;
		}
		catch(Exception e) {
			i = -1;
		}
		return i;
	}
	public List<LinkBean> getAllLinks(){
		return smt.query("select * from linktable", new BeanPropertyRowMapper<LinkBean>(LinkBean.class));
	}
}
