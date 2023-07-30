package com.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.CounsellingCancellationMessageBean;

@Repository
public class CounsellingCancellationMailDao {
	
	@Autowired
	JdbcTemplate smt;
	
	public CounsellingCancellationMessageBean getMessage() {
		return smt.query("select * from counsellingcancellingmessage", new BeanPropertyRowMapper<CounsellingCancellationMessageBean>(CounsellingCancellationMessageBean.class)).get(0);
	}
	
	public int updateMessage(CounsellingCancellationMessageBean counsellingBean) {
		int i = 0;
		try {
			smt.update("update counsellingcancellingmessage set subject = ?, body= ?",counsellingBean.getSubject(),counsellingBean.getBody());
			i = 1;
		}
		catch(Exception e) {
			i = -1;
		}
		return i;
	}
}

