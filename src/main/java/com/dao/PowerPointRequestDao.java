package com.dao;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.PowerPointRequest;

@Repository
public class PowerPointRequestDao {

	@Autowired
	JdbcTemplate smt;

	public int insertRequest(PowerPointRequest powerPointRequest) {
		int i = 0;
		try {
			smt.update("insert into pptrequesttable(userid,requestquery,requestat,queryover) values(?,?,?,?)",
					powerPointRequest.getUserID(),powerPointRequest.getRequestQuery(),powerPointRequest.getRequestAt(),powerPointRequest.isQueryOver());
			i = 1;
		}
		catch(Exception e) {
			i = -1;
		}
		return i;
	}
	public List<PowerPointRequest> getAllRequest(){
		return smt.query("select * from pptrequesttable join usertable using (userid)", new BeanPropertyRowMapper<PowerPointRequest>(PowerPointRequest.class));
	}
	public List<PowerPointRequest> getAllRequestUserSpecific(int userID){
		return smt.query("select * from pptrequesttable join usertable using (userid) where userid=?",new Object[] {userID},new int[] {java.sql.Types.BIGINT}, new BeanPropertyRowMapper<PowerPointRequest>(PowerPointRequest.class));
	}
	public int updateComment(int requestID, String comment) {
		int i = 200;
		try {
			smt.update("update pptrequesttable set comment = ? where requestid=?", comment,requestID);
		}
		catch(Exception e) {
			e.printStackTrace();
			i = -1;
		}
		return i;
	}
	public int closePPTRequestQuery(int requestID) {
		int i = 1;
		try {
			LocalDateTime ct = LocalDateTime.now(ZoneId.of("Asia/Kolkata"));
			
			smt.update("update pptrequesttable set queryover=true,queryfinishtime=? where requestid=?",Timestamp.valueOf(ct),requestID);
		}catch(Exception e) {
			e.printStackTrace();
			i = -1;
		}
		return i;
	}
	public PowerPointRequest getRequestByID(int requestID) {
		try {
			List<PowerPointRequest> list = smt.query("select * from pptrequesttable where requestid=?",new Object[] {requestID},new int[] {java.sql.Types.BIGINT}, new BeanPropertyRowMapper<PowerPointRequest>(PowerPointRequest.class));
			if(list.size() == 1) {
				return list.get(0);
			}
			else {
				return null;
			}
		}catch(Exception e) {
			return null;			
		}
	}
	
}
