package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.OttreDto;
import db.DbConnect;

public class OttreDao {
	DbConnect db=new DbConnect();
	//전체 리스트
	public List<OttreDto> getAllRe(String contentnum){
		List<OttreDto> list=new ArrayList<>();
		String sql="select * from ottre where contentnum=?";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, contentnum);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OttreDto dto=new OttreDto();
				dto.setNum(rs.getString("num"));
				dto.setContentnum(rs.getString("contentnum"));
				dto.setOttid(rs.getString("ottid"));
				dto.setTxt(rs.getString("txt"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt, rs);
		}
		return list;
	}//all
	
	//insert
	public void insertRe(OttreDto dto) {
		String sql="insert into ottre values (null,?,?,?,now())";
		
		Connection conn=null;
		PreparedStatement pstmt=null;
		
		conn=db.getMysqlConnection();
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContentnum());
			pstmt.setString(2, dto.getOttid());
			pstmt.setString(3, dto.getTxt());
			
			pstmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			db.dbClose(conn, pstmt);
		}
	}
}
