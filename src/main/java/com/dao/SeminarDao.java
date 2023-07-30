package com.dao;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.SeminarBean;
import com.bean.SeminarRegistrationUser;
import com.bean.TokenBean;

@Repository
public class SeminarDao {

	@Autowired
	JdbcTemplate smt;
	public int  addSeminar(SeminarBean seminarBean) {
		int i = 0;
		try {
			smt.update("insert into seminartable(seminarname,seminartype,seminarfees,seminarstart,seminarend,"
					+ "seminarregistrationstart,seminarregistrationend,acceptingregistration,seminarzoomlink,seminardescription,"
					+ "imgpathGujarati,imgpathenglish,whatsapplink) values(?,?,?,?,?,?,?,?,?,?,?,?,?)",seminarBean.getSeminarName(),
					seminarBean.getSeminarType(),seminarBean.getSeminarFees(),seminarBean.getSeminarStart(),
					seminarBean.getSeminarEnd(),seminarBean.getSeminarRegistrationStart(),seminarBean.getSeminarRegistrationEnd(),
					seminarBean.isAcceptingRegistration(),seminarBean.getSeminarZoomLink(),seminarBean.getSeminarDescription(),
					seminarBean.getImgPathGujarati(),seminarBean.getImgPathEnglish(),seminarBean.getWhatsappLink());
			i = 1;
		}
		catch(Exception e) {
			e.printStackTrace();
			i = -1;
		}
		return i;
	}
	public SeminarBean getSeminarByID(int seminarID) {
		try {
			return smt.query("select * from seminartable where seminarid=?",new Object[] {seminarID},new int[] {java.sql.Types.BIGINT}, new BeanPropertyRowMapper<SeminarBean>(SeminarBean.class)).get(0);
		}catch(Exception e) {
			return null;
		}
	}
	public List<SeminarBean> getAllSeminar() {
		try {
			return smt.query("select * from seminartable", new BeanPropertyRowMapper<SeminarBean>(SeminarBean.class));
		}catch(Exception e) {
			return null;
		}
	}
	public int updateSeminar(SeminarBean seminarBean) {
		int i = 0;
		try {
			smt.update("update seminartable set seminarname = ?,seminartype = ? ,seminarfees = ? ,seminarstart = ?,seminarend= ?,"
					+ "seminarregistrationstart= ?,seminarregistrationend= ?,acceptingregistration= ?,seminarzoomlink= ?,seminardescription= ?"
					+ ",imgpathGujarati= ?,imgpathenglish= ?,whatsapplink= ? where seminarid= ?",seminarBean.getSeminarName(),
					seminarBean.getSeminarType(),seminarBean.getSeminarFees(),seminarBean.getSeminarStart(),
					seminarBean.getSeminarEnd(),seminarBean.getSeminarRegistrationStart(),seminarBean.getSeminarRegistrationEnd(),
					seminarBean.isAcceptingRegistration(),seminarBean.getSeminarZoomLink(),seminarBean.getSeminarDescription(),
					seminarBean.getImgPathGujarati(),seminarBean.getImgPathEnglish(),seminarBean.getWhatsappLink(),seminarBean.getSeminarID());
			i  = 1;
		}
		catch(Exception e) {
			e.printStackTrace();
			i = -1;
		}
		return i;
	}

	public List<SeminarBean> getActiveSeminar(){
		LocalDateTime ct = LocalDateTime.now(ZoneId.of("Asia/Kolkata"));
		Timestamp ctim = Timestamp.valueOf(ct);  
		try {
			return smt.query("select * from seminartable where (? between seminarregistrationstart::timestamp and seminarregistrationend::timestamp) and (acceptingregistration=true)",new Object[] {ctim},new int[] {java.sql.Types.TIMESTAMP}, new BeanPropertyRowMapper<SeminarBean>(SeminarBean.class));
		}
		catch(Exception e) {
			return null;
		}
	}
	public List<SeminarBean> getActiveSeminarSeminarListByUser(int userID) {
		LocalDateTime ct = LocalDateTime.now(ZoneId.of("Asia/Kolkata"));
		Timestamp ctim = Timestamp.valueOf(ct);  
		try {
			return smt.query("select seminartable.* from seminartable where not exists (select * from seminarregistration where seminartable.seminarid = seminarregistration.seminarid and userid= ?) and  (? between seminarregistrationstart::timestamp and seminarregistrationend::timestamp) and (acceptingregistration=true)",new Object[] {userID,ctim},new int[] {java.sql.Types.BIGINT,java.sql.Types.TIMESTAMP}, new BeanPropertyRowMapper<SeminarBean>(SeminarBean.class));
		}
		catch(Exception e) {
			return null;
		}

	}
	public List<SeminarBean> getSeminarListForRegisterated(int userID) {
		try {
			return smt.query("select seminartable.* from seminartable where exists (select * from seminarregistration where seminartable.seminarid = seminarregistration.seminarid and userid= ?)",new Object[] {userID},new int[] {java.sql.Types.BIGINT}, new BeanPropertyRowMapper<SeminarBean>(SeminarBean.class));
		}
		catch(Exception e) {
			return null;
		}
	}
	public List<SeminarRegistrationUser> getSeminarListForRegisteratedList(int userID) {
		try {
			return smt.query("select * from seminartable join seminarregistration using (seminarid) where userid= ?",new Object[] {userID},new int[] {java.sql.Types.BIGINT}, new BeanPropertyRowMapper<SeminarRegistrationUser>(SeminarRegistrationUser.class));
		}
		catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<String> getTokenListRegisteredUsers(int seminarID) {
		ArrayList<String> list = new ArrayList<String>();
		try {
			List<TokenBean> listToken = smt.query("select * from usertable,seminarregistration where seminarregistration.userid=usertable.userid and seminarregistration.seminarid = ?",new Object[] {seminarID},new int[] {java.sql.Types.BIGINT}, new BeanPropertyRowMapper<TokenBean>(TokenBean.class));
			for(TokenBean t : listToken) {
				list.add(t.getTokenID());
			}
			return list;
		}catch(Exception e) {
			e.printStackTrace();
			return list;
		}
	}
}
