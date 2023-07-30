package com.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.AdminBean;
import com.bean.LoginBean;

@Repository
public class AdminDao {
	
	@Autowired
	JdbcTemplate smt;
	
	public boolean checkDuplicateEmail(String email) {
		List<AdminBean> admin = smt.query("select * from admintable where emailid = ?",new Object[] {email}, new int[] {java.sql.Types.LONGVARCHAR}, new BeanPropertyRowMapper<AdminBean>(AdminBean.class));
		if (admin.size() != 0)
			return false;
		else
			return true;
	}

	public int addAdmin(AdminBean admin) {
		int i = -1;
		try {
			smt.update("insert into admintable (emailid,name,password,createdat) values(?,?,?,?)",admin.getEmailID(),admin.getName(),admin.getPassword(),admin.getCreatedAt());
			i = 1;
		}catch(Exception e) {
			i = 0;
		}
		return i;
	}
	
	public List<AdminBean> getAllAdmin(){
		return smt.query("select * from admintable",  new BeanPropertyRowMapper<AdminBean>(AdminBean.class));
	}

	public int deleteAdmin(int adminID) {
		int i  = -1;
		try {
			smt.update("delete from admintable where adminid = ?",adminID);
			i = 1;
		}
		catch(Exception e) {
			i = 0;
		}

		return i;
	}
	public AdminBean loginAdmin(LoginBean loginBean) {
		AdminBean adminBean = null;
		try{
			List<AdminBean> user = smt.query("select * from admintable where emailid=? and password=?",new Object[] {loginBean.getEmailID(),loginBean.getPassword()},new int[] {java.sql.Types.VARCHAR,java.sql.Types.VARCHAR}, new BeanPropertyRowMapper<AdminBean>(AdminBean.class));
			if(user.size()==1) {
				adminBean=user.get(0);
			}
		}catch(Exception e) {
			
		}
		return adminBean;
		
	}
	public AdminBean getAdminByEmailID(String emailID) {
		AdminBean adminBean = null;
		try{
			List<AdminBean> user = smt.query("select * from admintable where emailid=?",new Object[] {emailID},new int[] {java.sql.Types.VARCHAR}, new BeanPropertyRowMapper<AdminBean>(AdminBean.class));
			if(user.size()==1) {
				adminBean=user.get(0);
			}
		}catch(Exception e) {
			
		}
		return adminBean;
		
	}

	public int changePassword(String password, String emailID) {
		int i = 0;
		try {
			smt.update("update admintable set password=? where emailid=?",password,emailID);
			i= 1;
		}catch(Exception e) {
			
		}
		return i;
	}
	

}
