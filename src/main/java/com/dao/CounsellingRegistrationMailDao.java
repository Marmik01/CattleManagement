package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CounsellingRegistrationBean;

@Repository
public class CounsellingRegistrationMailDao {
	
	@Autowired
	JdbcTemplate smt;
	
	public CounsellingRegistrationBean getMessage() {
		return smt.query("select * from counsellingregistrationmessage", new BeanPropertyRowMapper<CounsellingRegistrationBean>(CounsellingRegistrationBean.class)).get(0);
	}
	public int updateMessage(CounsellingRegistrationBean counsellingBean) {
		int i = 0;
		try {
			smt.update("update counsellingregistrationmessage set subject = ?, body= ?",counsellingBean.getSubject(),counsellingBean.getBody());
			i = 1;
		}
		catch(Exception e) {
			i = -1;
		}
		return i;
	}
}
