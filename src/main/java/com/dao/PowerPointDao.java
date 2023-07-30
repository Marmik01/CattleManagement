package com.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.PowerPointBean;
import com.bean.PowerPointKeyword;
import com.fasterxml.jackson.core.JsonProcessingException;

@Repository
public class PowerPointDao {
	
	@Autowired
	JdbcTemplate smt;

	public List<PowerPointBean> getAllPowerPoints() {
		return smt.query("select * from powerpointtable", new BeanPropertyRowMapper<PowerPointBean>(PowerPointBean.class));
	}

	public int addPresentation(PowerPointBean powerPointBean) {
		int i = 0;
		try {
			smt.update("insert into powerpointtable(filename,ppturl,pptactive,addedat) values(?,?,?,?)",
					powerPointBean.getFileName(),powerPointBean.getPptURL(),powerPointBean.isPptActive(),
					powerPointBean.getAddedAt());
			i = 1;
		}catch(Exception e) {
			e.printStackTrace();
			i = -1;
		}
		return i;
	}
	public PowerPointBean getPowerPointDetailsByID(int pptID) {
		try {
			return smt.query("select * from powerpointtable where pptid=?",new Object[] {pptID},new int[] {java.sql.Types.BIGINT}, new BeanPropertyRowMapper<PowerPointBean>(PowerPointBean.class)).get(0);
		}catch(Exception e) {
			return null;
		}
	}

	public boolean activatePPT(int pptID) {
		boolean flag = true;
		try {
			smt.update("update powerpointtable set pptactive=true where pptid=?",pptID);
		}catch(Exception e) {
			flag = false;
		}
		return flag;
	}

	public boolean deactivatePPT(int pptID) {
		boolean flag = true;
		try {
			smt.update("update powerpointtable set pptactive=false where pptid=?",pptID);
		}catch(Exception e) {
			flag = false;
		}
		return flag;
	}

	public int updatePresentation(PowerPointBean powerPointBean) {
		int i = 0;
		try {
			smt.update("update powerpointtable set ppturl=?, filename=? where pptid=?",powerPointBean.getPptURL(),powerPointBean.getFileName(),powerPointBean.getPptID());
			i = 1;
		}catch(Exception e) {
			e.printStackTrace();
			i = -1;
		}
		return i;
	}

	public List<String> getPowerPointKeywords(int pptID) throws JsonProcessingException {		
		List<PowerPointKeyword> list = smt.query("select * from pptkeywordtable where pptid = ?",new Object[] {pptID},new int [] {java.sql.Types.BIGINT}, new BeanPropertyRowMapper<PowerPointKeyword>(PowerPointKeyword.class));
		List<String> listKeyword = new ArrayList<String>();
		
		for(int i = 0;i<list.size();i++) {
			listKeyword.add(list.get(i).getKeyword());
		} 
		return listKeyword;
	}

	public int addKeyword(PowerPointKeyword powerPointKeyword) {
		int i = 200;
		try {
			smt.update("insert into pptkeywordtable(pptid,keyword) values(?,?)", powerPointKeyword.getPptID(),powerPointKeyword.getKeyword().trim().toLowerCase());
		}catch(Exception e) {
			i = -1;
		}
		return i;
	}

	public int removeKeyword(PowerPointKeyword powerPointKeyword) {
		int i = 200;
		try {
			smt.update("delete from pptkeywordtable where pptid=? and keyword=?", powerPointKeyword.getPptID(),powerPointKeyword.getKeyword());
		}catch(Exception e) {
			i = -1;
		}
		return i;
	}

	public List<PowerPointBean> getAllActivePowerPoints() {
		return smt.query("select * from powerpointtable where pptactive=true", new BeanPropertyRowMapper<PowerPointBean>(PowerPointBean.class));

	}

	public List<PowerPointBean> getAllActiveSearchedPowerPoints(String[] words) {
		return smt.query("select distinct pptid,filename,ppturl,pptactive,addedat from pptkeywordtable join powerpointtable using (pptid) where keyword like any(array[?]) and pptactive = true order by pptid",new Object[] {words},new int[] {java.sql.Types.ARRAY}, new BeanPropertyRowMapper<PowerPointBean>(PowerPointBean.class));
	}
	
}
