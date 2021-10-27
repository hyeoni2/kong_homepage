package com.kong.dao;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kong.dto.MemberDTO;
import com.kong.mybatis.sqlMapConfig;

public class MemberDAO {

SqlSessionFactory sqlSessionFactory = sqlMapConfig.getSqlSession();
	
	//mapper에 접근 하기 위한 sqlSession
	SqlSession sqlSession;
	
	
	private MemberDAO() {}
	
	private static MemberDAO instance = new MemberDAO();
	
	
	public static MemberDAO getInstance() {
		return instance;
	}
	
	
	/************************************************************/
	
	//추가
	public int setInsertMember(MemberDTO dto) {

		sqlSession = sqlSessionFactory.openSession();

		int result = 0;
		
		try {
			System.out.println(dto.toString());
			
			result = sqlSession.insert("memberInsert",dto);
			sqlSession.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	//패스워드 업데이트
	public int setChangePasswd(MemberDTO dto) {
		
		sqlSession = sqlSessionFactory.openSession();
		
		int result = 0;
		
		try {
			
			result = sqlSession.update("ChangePasswd",dto);
			sqlSession.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("오류 났다");
			System.out.println("result === >" + result);
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	

	//아이디 체크
	public String idCheck(String id) {
		
		sqlSession = sqlSessionFactory.openSession();
		
		String result = null;
		
		try {
			
			result = sqlSession.selectOne("idCheck", id);
			
			if (result != null) {
				result = "-1";
			} else {
				result = "1";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	//이메일 체크
	public String emailCheck(String email) {
		
		sqlSession = sqlSessionFactory.openSession();
		
		String result = null;

	try {
		
		result = sqlSession.selectOne("emailCheck", email);
		
			if (result != null) {
				result = "-1";
			} else {
				result = "1";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	
		return result;
	}
	
	
	//로그인 체크
	public MemberDTO LoginCheck(MemberDTO dto) {
		
		sqlSession = sqlSessionFactory.openSession();

		try {
			
			dto = sqlSession.selectOne("LoginCheck", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return dto;
	}

	//패스워드 체크
	public MemberDTO PasswdCheck(MemberDTO dto) {
		
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			
			dto = sqlSession.selectOne("PasswdCheck", dto);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return dto;
	}
	
	
	//삭제처리
	public int DeleteMember(MemberDTO dto) {
		
		sqlSession = sqlSessionFactory.openSession();
		
		int result = 0;
		
		try {
			
			result = sqlSession.delete("DeleteMember",dto);
			sqlSession.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
}
