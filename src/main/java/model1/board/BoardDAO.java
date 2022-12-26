package model1.board;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class BoardDAO extends JDBConnect {
	
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	public int selectCountG(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM board WHERE category='gongji' ";
		if(map.get("searchWord")!= null) {
			query += " AND " + map.get("searchField")
				+ " LIKE '%" + map.get("searchWord") + "%' ";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public int selectCountF(Map<String, Object> map) {
		int totalCount = 0;
		
		String query = "SELECT COUNT(*) FROM board WHERE category='free' ";
		if(map.get("searchWord")!= null) {
			query += " AND " + map.get("searchField") + " "
				+ " LIKE '%" + map.get("searchWord") + "%' ";
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("게시물 수를 구하는 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public int insertWrite(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO board ( "
					+ " title, content, id, category, ofile, sfile) "
					+ " Values (?, ?, ?, ?, ?, ?)";
					
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			psmt.setString(4, dto.getCategory());
			psmt.setString(5, dto.getOfile());
			psmt.setString(6, dto.getSfile());
			
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		
		String query = "SELECT B.*, M.name "
					+ " FROM membership M INNER JOIN board B "
					+ " ON M.id = B.id "
					+ " WHERE num = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, num);
			rs = psmt.executeQuery();
			if(rs.next()) {
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString(3));
				dto.setId(rs.getString(4));
				dto.setCategory(rs.getString(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setPostdate(rs.getDate(8));
				dto.setVisitcount(rs.getInt(9));
				dto.setDownloadcount(rs.getInt(10));
				dto.setName(rs.getString("name"));
			}
		}
		catch(Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	public void updateVisitCount(int num) {
		String query = "UPDATE board SET "
					+ " visitcount = visitcount + 1 "
					+ "WHERE num = ?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, num);
			psmt.executeQuery();
		}
		catch(Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public int updateEdit(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "UPDATE board SET "
					+ " title=?, content=?, category=?, ofile=?, sfile=? "
					+ " WHERE num=?";
		psmt = con.prepareStatement(query);
		psmt.setString(1, dto.getTitle());
		psmt.setString(2, dto.getContent());
		psmt.setString(3, dto.getCategory());
		psmt.setString(4, dto.getOfile());
		psmt.setString(5, dto.getSfile());
		psmt.setString(6, dto.getNum());
		result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public int deletePost(BoardDTO dto) {
		int result = 0;
		
		try {
			String query = "DELETE FROM board WHERE num=?";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());
			
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public List<BoardDTO> selectListPageG(Map<String, Object> map){
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();
		
		String query = "SELECT * FROM board WHERE category='gongji' ";
		if(map.get("searchWord") != null) {
			query += " AND " + map.get("searchField")
					+ "	LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += " ORDER BY num DESC LIMIT ?, ? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getInt("visitcount"));
				
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}
	
	public List<BoardDTO> selectListPageF(Map<String, Object> map){
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();
		
		String query = "SELECT * FROM board WHERE category='free' ";
		if(map.get("searchWord") != null) {
			query += " AND " + map.get("searchField")
					+ "	LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += " ORDER BY num DESC LIMIT ?, ? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getInt("visitcount"));
				
				bbs.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return bbs;
	}
}	