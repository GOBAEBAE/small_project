package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

import data.dto.MyShopDto;
import data.dto.OttDto;
import db.DbConnect;

public class OttDao {
	//전체 리스트
	DbConnect db=new DbConnect();
	public List<OttDto> getTotalList(){
		List<OttDto> list=new ArrayList<>();
		
		String sql="select * from Ott_contents order by startday desc";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				//dto 생성
				OttDto dto=new OttDto();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setPhoto(rs.getString("photo"));
				dto.setActors(rs.getString("actors"));
				dto.setOtt(rs.getString("ott"));
				dto.setStartday(rs.getTimestamp("startday"));
				//리스트에 추가
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		
		return list;
	}//getTotallist
	
	//insert
	public void insertContents(OttDto dto) {
		String sql="insert into Ott_contents (num,title,photo,actors,ott,startday) values (null,?,?,?,?,?)";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setString(3, dto.getActors());
			pstmt.setString(4, dto.getOtt());
			pstmt.setTimestamp(5, dto.getStartday());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
	}//insert
	
	//detailview
	public OttDto getDetail(String num) {
		OttDto dto= new OttDto();
		
		String sql="select * from Ott_contents where num=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setPhoto(rs.getString("photo"));
				dto.setActors(rs.getString("actors"));
				dto.setOtt(rs.getString("ott"));
				dto.setStartday(rs.getTimestamp("startday"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt, rs);
		}
		return dto;
	}
	
	//update
	public void updateContent(OttDto dto) {
		String sql="update ott_contents set title=?,photo=?,actors=?,ott=?,startday=? where num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getPhoto());
			pstmt.setString(3, dto.getActors());
			pstmt.setString(4, dto.getOtt());
			pstmt.setTimestamp(5, dto.getStartday());
			pstmt.setString(6, dto.getNum());
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		
	}//update
	
	//delete
	public void deleteContent(String num) {
		String sql="delete from ott_contents where num=?";
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			//바인딩
			pstmt.setString(1, num);
			//실행
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(conn, pstmt);
		}
		
		}//delete
	
	//검색
		public List<OttDto> searchOtt(String word){
			List<OttDto> list=new ArrayList<>();
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			String sql="select * from ott_contents where title like ? or actors like ? order by startday desc";
			
			//db연결
			conn=db.getMysqlConnection();
			try {
				pstmt=conn.prepareStatement(sql);
				//바인딩
				pstmt.setString(1, "%"+word+"%");
				pstmt.setString(2, "%"+word+"%");
				rs=pstmt.executeQuery(); //rs 반환
				while(rs.next()) {
					//dto 생성
					OttDto dto=new OttDto();
					dto.setNum(rs.getString("num"));
					dto.setTitle(rs.getString("title"));
					dto.setPhoto(rs.getString("photo"));
					dto.setActors(rs.getString("actors"));
					dto.setOtt(rs.getString("ott"));
					dto.setStartday(rs.getTimestamp("startday"));
					//리스트에 추가
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
	//max num
	public int getMaxnum() {
		int maxNum=0;
		String sql="select max(num) max from ott_contents";
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				maxNum=rs.getInt("max");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {db.dbClose(conn, pstmt, rs);}
		return maxNum;
	}
		
}//class
