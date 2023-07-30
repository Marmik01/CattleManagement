package com.dao;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.BookedTimeSlotBean;
import com.bean.BookingTimeSlotBean;
import com.bean.BookingTimeSlotBeanString;
import com.bean.PersonalCounsellingBookBean;
import com.bean.TimeSlotBean;

@Repository
public class TimeSlotDao {
	
	@Autowired
	JdbcTemplate smt;
	
	public int inserTimeSlot(TimeSlotBean timeSlotBean) {
		int i = 0;
		try {
			smt.update("insert into timeslottable (starttime,endtime,counsellingtype,link,booked) values (?,?,?,?,?)",timeSlotBean.getStartTime(),timeSlotBean.getEndTime(),timeSlotBean.getCounsellingType(),timeSlotBean.getLink(),false);
			i = 1;
		}
		catch(Exception e) {
			e.printStackTrace();
			i = -1;
		}
		return i;
	}

	public List<BookedTimeSlotBean> getAllUnBookedCounsellingSlotsOfThisMonth(Timestamp timeStamp){
		return smt.query("select * from timeslottable where booked = false and starttime >= ?",new Object[] {timeStamp}, new int[] {java.sql.Types.TIMESTAMP}, new BeanPropertyRowMapper<BookedTimeSlotBean>(BookedTimeSlotBean.class));
	}
	
	public List<BookedTimeSlotBean> getAllBookedCounsellingSlotsOfThisMonth(Timestamp timeStamp){
		return smt.query("select usertable.userid,firstname,lastname,timeslottable.timeslotid,timeslottable.starttime,timeslottable.endtime,timeslottable.link,timeslottable.counsellingtype,timeslottable.booked from usertable,timeslottable,personalcounsellingbooked where personalcounsellingbooked.userid = usertable.userid and personalcounsellingbooked.timeslotid=timeslottable.timeslotid and timeslottable.starttime >= ? and timeslottable.booked=true",new Object[] {timeStamp}, new int[] {java.sql.Types.TIMESTAMP}, new BeanPropertyRowMapper<BookedTimeSlotBean>(BookedTimeSlotBean.class));
	}
	public List<BookedTimeSlotBean> getAllBookedCounsellingSlots(){
		return smt.query("select usertable.userid,firstname,lastname,timeslottable.timeslotid,timeslottable.starttime,timeslottable.endtime,timeslottable.link,timeslottable.counsellingtype,timeslottable.booked from usertable,timeslottable,personalcounsellingbooked where personalcounsellingbooked.userid = usertable.userid and personalcounsellingbooked.timeslotid=timeslottable.timeslotid and timeslottable.booked=true", new BeanPropertyRowMapper<BookedTimeSlotBean>(BookedTimeSlotBean.class));
	}
	public TimeSlotBean getTimeSlotByID(int timeSlotID) {
		TimeSlotBean timeSlotBean = null;
		try{
			timeSlotBean = smt.query("select * from timeslottable where timeslotid=?",new Object[] {timeSlotID},new int[] {java.sql.Types.BIGINT}, new BeanPropertyRowMapper<TimeSlotBean>(TimeSlotBean.class)).get(0);
		}
		catch(Exception e) {
			
		}
		return timeSlotBean;
	}
	public boolean checkWhetherUserAlreadyRegistered(int userID,int timeSlotID) {
		boolean flag = false;
		try {
			if (smt.query("select * from personalcounsellingbooking where timeslotid = ? and userid = ?",new Object[] {timeSlotID,userID}, new int[] {java.sql.Types.BIGINT,java.sql.Types.BIGINT}, new BeanPropertyRowMapper<BookedTimeSlotBean>(BookedTimeSlotBean.class)).size() != 0)
			{
				flag = true;
			}
			
			
		}catch(Exception e) {
			
		}
		return flag;
	}
	
	public List<BookedTimeSlotBean> getAllCounsellingSlotsOfThisMonth() {
		List<BookedTimeSlotBean> timeSlotList = new ArrayList<BookedTimeSlotBean>();
		try {
	     	LocalDateTime ct = LocalDateTime.now(ZoneId.of("Asia/Kolkata"));
	   		Calendar cal = Calendar.getInstance();
		    cal.set(ct.getYear(), ct.getMonthValue()-1, ct.getDayOfMonth(), 0, 0);
		    cal.set(Calendar.SECOND, 0);
		    cal.set(Calendar.MILLISECOND, 0);		        
		    Timestamp tSearch = new Timestamp(cal.getTimeInMillis());
	        List<BookedTimeSlotBean> bookedList = getAllBookedCounsellingSlotsOfThisMonth(tSearch);
			List<BookedTimeSlotBean> unBookedList = getAllUnBookedCounsellingSlotsOfThisMonth(tSearch);	
			if(bookedList != null) {
				timeSlotList.addAll(bookedList);
			}
			if(unBookedList != null) {
				timeSlotList.addAll(unBookedList);
			}
		}catch(Exception e) {
		
		}
		return timeSlotList;
	}

	public boolean insertRequestPersonalCounselling(PersonalCounsellingBookBean pb) {
		boolean flag = true;
		try {
			smt.update("insert into personalcounsellingbooking(timeslotid,userid, requestedat) values(?,?,?)",pb.getTimeSlotID(),pb.getUserID(),pb.getRequestedAt());
			smt.update("update timeslottable set request=true where timeslotid=?",pb.getTimeSlotID());
		}
		catch(Exception e) {
			flag = false;
		}
		return flag;
	}
	public List<BookingTimeSlotBeanString> getAllPersonalCounsellingRequestList(){
		return smt.query("select * from personalcounsellingbooking inner join usertable using (userid) inner join timeslottable using (timeslotid) where accepted is null", new BeanPropertyRowMapper<BookingTimeSlotBeanString>(BookingTimeSlotBeanString.class));
	}
	public List<BookingTimeSlotBeanString> getAllPersonalCounsellingRequestListByUser(int userID){
		return smt.query("select * from personalcounsellingbooking inner join usertable using (userid) inner join timeslottable using (timeslotid) where userID = ?",new Object[] {userID},new int[] {java.sql.Types.BIGINT}, new BeanPropertyRowMapper<BookingTimeSlotBeanString>(BookingTimeSlotBeanString.class));
	}

	public int updateBookingRequestUser(int personalCID,int userID,int timeSlotID) {
		int i  =0;
	 	LocalDateTime ct = LocalDateTime.now(ZoneId.of("Asia/Kolkata"));
	 	Timestamp acceptedAt = Timestamp.valueOf(ct);   
		try {
			smt.update("update personalcounsellingbooking set accepted=true where personalcid=?",new Object[] {personalCID}, new int[] {java.sql.Types.BIGINT});
			smt.update("insert into personalcounsellingbooked(acceptedat,userid,timeslotid) values(?,?,?)",acceptedAt,userID,timeSlotID);
			smt.update("update timeslottable set booked = true where timeSlotID=?",timeSlotID);
			i = 1;
		}catch(Exception e) {
			e.printStackTrace();
			i = -1;
		}
		return i;
	}

	public int updateBookingRequest(int userID, int timeSlotID) {
		int i = 0;
		try {
			smt.update("update personalcounsellingbooking set accepted = false where userid != ? and timeslotid=?",userID,timeSlotID);
			i = 1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return i;
	}

	public int cancelBookedAppointment(int timeSlotID) {
		int i = 0;
		try {
			smt.update("delete from personalcounsellingbooked where timeslotid=?",timeSlotID);
			smt.update("delete from personalcounsellingbooking where timeslotid=?",timeSlotID);
			smt.update("delete from timeslottable where timeslotid=?",timeSlotID);			
			i = 1;
		}catch(Exception e) {
			i = -1;
		}
		return i;
	}

	public int cancelNonBookedAppointment(int timeSlotID) {
		int i = 0;
		try {
			smt.update("delete from personalcounsellingbooking where timeslotid=?",timeSlotID);
			smt.update("delete from timeslottable where timeslotid=?",timeSlotID);			
			i = 1;
		}catch(Exception e) {
			i = -1;
		}
		return i;
	}
	public BookingTimeSlotBean getPersonalCounsellingBooked(int timeSlotID) {
		BookingTimeSlotBean bookedTimeSlotBean = null;
		try {
			bookedTimeSlotBean= smt.query("select * from personalcounsellingbooked join usertable using (userid) where timeslotid = ?",new Object[] {timeSlotID}, new int[] {java.sql.Types.BIGINT},new BeanPropertyRowMapper<BookingTimeSlotBean>(BookingTimeSlotBean.class)).get(0);
			
		}catch(Exception e) {
			
		}
		return bookedTimeSlotBean;
	}
	public List<TimeSlotBean> getAllActiveCounsellingSlots(){
		LocalDateTime ct = LocalDateTime.now(ZoneId.of("Asia/Kolkata"));
   		Calendar cal = Calendar.getInstance();
	    cal.set(ct.getYear(), ct.getMonthValue()-1, ct.getDayOfMonth(), 0, 0);
	    cal.set(Calendar.SECOND, 0);
	    cal.set(Calendar.MILLISECOND, 0);		        
	    Timestamp tSearch = new Timestamp(cal.getTimeInMillis());
		return smt.query("select * from timeslottable where starttime >= ? and booked = false",new Object[] {tSearch}, new int[] {java.sql.Types.TIMESTAMP}, new BeanPropertyRowMapper<TimeSlotBean>(TimeSlotBean.class));
	}
	public List<TimeSlotBean> getAllActiveCounsellingSlotsForSelectedDate(String date){
		String[] dateArray = date.split("-");		
		
		Calendar cal = Calendar.getInstance();
	    cal.set(Integer.parseInt(dateArray[2]),Integer.parseInt(dateArray[1]) -1, Integer.parseInt(dateArray[0]), 0, 0);
	    
	    Calendar cal1 = Calendar.getInstance();
	    cal1.set(Integer.parseInt(dateArray[2]),Integer.parseInt(dateArray[1]) -1, Integer.parseInt(dateArray[0]), 0, 0);
	    cal1.add(Calendar.DAY_OF_MONTH, 1);
	 
	    Timestamp tSearchS = new Timestamp(cal.getTimeInMillis());
	    Timestamp tSearchE = new Timestamp(cal1.getTimeInMillis());
	    return smt.query("select * from timeslottable where starttime between ? and ? and booked = false and request = false",new Object[] {tSearchS,tSearchE}, new int[] {java.sql.Types.TIMESTAMP,java.sql.Types.TIMESTAMP}, new BeanPropertyRowMapper<TimeSlotBean>(TimeSlotBean.class));
	}
}
