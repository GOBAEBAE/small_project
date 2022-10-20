package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.OttIdDto;
import db.DbConnect;

public class OttIdDao {
	DbConnect db=new DbConnect();
	
	//계정추가
	public void addId(OttIdDto dto) {
		String sql="insert into ott_id values (null,?,?,?,'0')";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getOttid());
			pstmt.setString(2, dto.getOttpw());
			pstmt.setString(3, dto.getProfileimage());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}
	//계정 리스트
	public List<OttIdDto> getList(){
		List<OttIdDto> list=new ArrayList<>();
		String sql="select * from ott_id order by num desc";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OttIdDto dto=new OttIdDto();
				dto.setNum(rs.getString("num"));
				dto.setOttid(rs.getString("ottid"));
				dto.setOttpw(rs.getString("ottpw"));
				dto.setProfileimage(rs.getString("profileimage"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}
	//계정
	public OttIdDto getIdnum(String num) {
		OttIdDto dto=new OttIdDto();
		
		String sql="select * from ott_id where num=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setOttid(rs.getString("ottid"));
				dto.setProfileimage(rs.getString("profileimage"));
				dto.setContentnum(rs.getString("contentnum"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt,rs);
		}
		
		return dto;
	}
	//현재 좋아하는 컨텐츠 얻기
	public String getContentNum(String num) {
		String contentnums="";
		
		String sql="select * from ott_id where num=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				contentnums=rs.getString("contentnum");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt,rs);
		}
				
		return contentnums;
	}
	
	//좋아하는 컨텐츠 추가
	public void addConentNum(String num, String contentnum) {
		//기존값
		String contentnums = this.getContentNum(num);
		String []arrCN=contentnums.split(",");
		
		for (String cn:arrCN) {
			//System.out.println(contentnum);
			//System.out.println(cn);
			//System.out.println(cn.equals(contentnum));
			if(contentnum.equals(cn)) return;
		}
		contentnums+=","+contentnum;
		//System.out.println(contentnums);
		//System.out.println(num+contentnums);
		String sql="update ott_id set contentnum=? where num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, contentnums);
			pstmt.setString(2, num);
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally { db.dbClose(conn, pstmt);}
	}
	
	//좋아하는 컨텐츠 추가
		public void delConentNum(String num, String contentnum) {
			//기존값
			String contentnums = this.getContentNum(num);
			String []arrCN=contentnums.split(",");
			contentnums="0";
			
			for (String cn:arrCN) {
				
				//System.out.println(contentnum);
				//System.out.println(cn);
				//System.out.println(cn.equals(contentnum));
				if(!(cn.equals("0"))){
					if(!(cn.equals(contentnum))) {
						contentnums+=","+cn;
					}
				}}
			//System.out.println(contentnums);
			//System.out.println(contentnums);
			//System.out.println(num+contentnums);
			String sql="update ott_id set contentnum=? where num=?";
			Connection conn=null;
			PreparedStatement pstmt=null;
			
			conn=db.getMysqlConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, contentnums);
				pstmt.setString(2, num);
				//실행
				pstmt.execute();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally { db.dbClose(conn, pstmt);}
		}
	
}