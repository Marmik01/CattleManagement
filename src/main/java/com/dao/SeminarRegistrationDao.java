package com.dao;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.SeminarRegisteredUsers;
import com.bean.SeminarRegistrationBean;

@Repository
public class SeminarRegistrationDao {

	@Autowired
	JdbcTemplate smt;
	
	public int registerSeminar(SeminarRegistrationBean registerBean) {
		int i = 0;
		try {
			LocalDateTime ct = LocalDateTime.now(ZoneId.of("Asia/Kolkata"));
			Timestamp ctim = Timestamp.valueOf(ct);  
			smt.update("insert into seminarregistration(userid,seminarid,question,registrationat) values(?,?,?,?)",registerBean.getUserID(),
					registerBean.getSeminarID(),registerBean.getQuestion(),ctim);
			i = 1;
		}
		catch(Exception e) {
			e.printStackTrace();
			i = -1;
		}
		return i;
	}

	public List<SeminarRegisteredUsers> getAllRegisteredUsers(int seminarID){
		try {
			return smt.query("select * from usertable,seminarregistration where seminarregistration.userid=usertable.userid and seminarregistration.seminarid = ?", new Object[] {seminarID},new int[] {java.sql.Types.BIGINT}, new BeanPropertyRowMapper<SeminarRegisteredUsers>(SeminarRegisteredUsers.class));
		}
		catch(Exception e) {
			return null;
		}
	}
	public boolean checkIfUserIsRegistered(int userID,int seminarID) {
		try {
			List<SeminarRegistrationBean> list = smt.query("select * from seminarregistration where seminarid =  ? and userid = ?",new Object[] {seminarID,userID},new int[] {java.sql.Types.BIGINT,java.sql.Types.BIGINT},new BeanPropertyRowMapper<SeminarRegistrationBean>(SeminarRegistrationBean.class));
			if(list.size() > 0) {
				return false;
			}
			else {
				return true;
			}
		}catch(Exception e) {
			return false;
		}
	}
}
