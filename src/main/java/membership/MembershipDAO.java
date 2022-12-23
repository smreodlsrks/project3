package membership;

import javax.servlet.ServletContext;

import common.JDBConnect;
import model1.board.BoardDTO;

public class MembershipDAO extends JDBConnect {
	
	public MembershipDAO(ServletContext application) {
		super(application);
	}
	
	public MembershipDTO getMembershipDTO(String uid, String upass) {
		MembershipDTO dto = new MembershipDTO();
		String query = "SELECT * FROM membership WHERE id=? AND password=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getString(1));
				dto.setPassword(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setSex(rs.getString(4));
				dto.setBirth1(rs.getString(5));
				dto.setBirth2(rs.getString(6));
				dto.setBirth3(rs.getString(7));
				dto.setEmail1(rs.getString(8));
				dto.setEmail2(rs.getString(9));
				dto.setZipcode(rs.getString(10));
				dto.setAddr1(rs.getString(11));
				dto.setAddr2(rs.getString(12));
				dto.setPhone1(rs.getString(13));
				dto.setPhone2(rs.getString(14));
				dto.setPhone3(rs.getString(15));
				dto.setMobile1(rs.getString(16));
				dto.setMobile2(rs.getString(17));
				dto.setMobile3(rs.getString(18));
				dto.setQuiz(rs.getString(19));
				dto.setAnswer(rs.getString(20));
				dto.setRegidate(rs.getDate(21));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public MembershipDTO isMember(String id) {
		MembershipDTO dto = new MembershipDTO();
		String query = "SELECT count(*), id FROM membership WHERE id=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setName(rs.getString(1));
				dto.setId(rs.getString(2));				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int insertMember(MembershipDTO dto) {
		int result = 0;
		
		try {
			String query = "INSERT INTO membership Values ( "
						+ " ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, "
						+ " ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPassword());
			psmt.setString(3, dto.getName());
			psmt.setString(4, dto.getSex());
			psmt.setString(5, dto.getBirth1());
			psmt.setString(6, dto.getBirth2());
			psmt.setString(7, dto.getBirth3());
			psmt.setString(8, dto.getEmail1());
			psmt.setString(9, dto.getEmail2());
			psmt.setString(10, dto.getZipcode());
			psmt.setString(11, dto.getAddr1());
			psmt.setString(12, dto.getAddr2());
			psmt.setString(13, dto.getPhone1());
			psmt.setString(14, dto.getPhone2());
			psmt.setString(15, dto.getPhone3());
			psmt.setString(16, dto.getMobile1());
			psmt.setString(17, dto.getMobile2());
			psmt.setString(18, dto.getMobile3());
			psmt.setString(19, dto.getQuiz());
			psmt.setString(20, dto.getAnswer());
			
			result = psmt.executeUpdate();
		}
		catch(Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public MembershipDTO searchId(String name, String mobile1, String mobile2, String mobile3) {
		MembershipDTO dto = new MembershipDTO();
		String query = "SELECT count(*), id FROM membership WHERE name=? AND mobile1=? AND mobile2=? AND mobile3=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, name);
			psmt.setString(2, mobile1);
			psmt.setString(3, mobile2);
			psmt.setString(4, mobile3);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setName(rs.getString(1));
				dto.setId(rs.getString(2));				
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public MembershipDTO searchPw(String id, String mobile1, String mobile2, String mobile3) {
		MembershipDTO dto = new MembershipDTO();
		String query = "SELECT * FROM membership WHERE id=? AND mobile1=? AND mobile2=? AND mobile3=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, id);
			psmt.setString(2, mobile1);
			psmt.setString(3, mobile2);
			psmt.setString(4, mobile3);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setPassword(rs.getString(2));
				dto.setQuiz(rs.getString(19));
				dto.setAnswer(rs.getString(20));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}
