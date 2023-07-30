package com.dao;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.bean.VideoBean;

@Repository
public class VideoDao {

	@Autowired
	JdbcTemplate smt;
	
	public int updateVideo(VideoBean videoBean) {
		int i = 0;
		try {
			smt.update("update videotable set videotitle=?,videoyoutubelink=?,videodisplaylocation=?,videoactive=? where videoid=?",
					videoBean.getVideoTitle(),videoBean.getVideoYoutubeLink(),videoBean.getVideoDisplayLocation(),
					videoBean.isVideoActive(),videoBean.getVideoID());
			i  = 1;
		}
		catch(Exception e) {
			e.printStackTrace();
			i = -1;
		}
		return i;
	}

	public VideoBean getVideoByID(int videoID) {
		List<VideoBean> videos = smt.query("select * from videotable where videoid = ?",new Object[] {videoID}, new int[] {java.sql.Types.BIGINT}, new BeanPropertyRowMapper<VideoBean>(VideoBean.class));
		if (videos.size() != 0)
			return videos.get(0);
		else
			return null;
	}

	public int addVideo(VideoBean videoBean) {
		LocalDateTime ct = LocalDateTime.now(ZoneId.of("Asia/Kolkata"));
		Timestamp ctim = Timestamp.valueOf(ct);  
		try {
			smt.update("insert into videotable(videotitle,videodisplaylocation,addedat,videoactive,videoyoutubelink) values(?,?,?,?,?)",
					videoBean.getVideoTitle(),videoBean.getVideoDisplayLocation(),ctim,videoBean.isVideoActive(),videoBean.getVideoYoutubeLink());
			return 1;
		}
		catch(Exception e) {
			return -1;
		}
	}

	public List<VideoBean> getAllVideo() {
		try {
			return smt.query("select * from videotable", new BeanPropertyRowMapper<VideoBean>(VideoBean.class));
		}catch(Exception e) {
			return null;
		}
	}

	public int deactivateVideo(int videoID) {
		int i = 0;
		try {
			smt.update("update videotable set videoactive=false where videoid=?",videoID);
			i= 1;
		}catch(Exception e) {
			e.printStackTrace();
			i = -1;
		}
		return i;
	}

	public int activateVideo(int videoID) {
		int i = 0;
		try {
			smt.update("update videotable set videoactive=true where videoid=?",videoID);
			i= 1;
		}catch(Exception e) {
			e.printStackTrace();
			i = -1;
		}
		return i;
	}
}
