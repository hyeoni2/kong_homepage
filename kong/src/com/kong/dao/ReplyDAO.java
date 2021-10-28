package com.kong.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kong.dto.BoardDTO;
import com.kong.dto.MemberDTO;
import com.kong.dto.PageingDTO;
import com.kong.dto.ReplyDTO;
import com.kong.mybatis.sqlMapConfig;

public class ReplyDAO {

SqlSessionFactory sqlSessionFactory = sqlMapConfig.getSqlSession();
	
	//mapper에 접근 하기 위한 sqlSession
	SqlSession sqlSession;
	
	
	private ReplyDAO() {}
	
	private static ReplyDAO instance = new ReplyDAO();
	
	
	public static ReplyDAO getInstance() {
		return instance;
	}
	
	
	/************************************************************/
	
	//추가
	public int setInsertReply(ReplyDTO dto) {

		sqlSession = sqlSessionFactory.openSession();

		int result = 0;
		
		try {
			System.out.println(dto.toString());
			
			result = sqlSession.insert("InsertReply",dto);
			sqlSession.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
	//대댓글 추가
	public int setInsertReplys(ReplyDTO dto) {
		
		sqlSession = sqlSessionFactory.openSession();
		
		int result = 0;
		
		try {
			System.out.println(dto.toString());
			
			result = sqlSession.insert("InsertReplys",dto);
			sqlSession.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}

	//리스트
	public List<ReplyDTO>  SelectReplyAll(ReplyDTO dto) {
		
		sqlSession = sqlSessionFactory.openSession();
		
		List<ReplyDTO> list = new ArrayList<>();
		
		try {
			System.out.println(dto.toString());
			
			list = sqlSession.selectList("SelectReplyAll",dto);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
	}

	//한번보기
	public ReplyDTO SelectReplyPno(int no) {
		
		sqlSession = sqlSessionFactory.openSession();
		
		ReplyDTO dto = new ReplyDTO();
		
		try {
			
			dto = sqlSession.selectOne("SelectReplyPno", no);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return dto;
	}
	
	//전체 댓글
	public int CountReply(ReplyDTO dto) {
		
		sqlSession = sqlSessionFactory.openSession();
		
		int count = 0;
		
		try {
			
			count = sqlSession.selectOne("countReply",dto);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return count;
	}

	//삭제
	public int setReplyDelte(int no) {
		
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		
		try {
			
			result = sqlSession.delete("setReplyDelte",no);
			sqlSession.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}

	//부모댓삭제
	public int setReplyDelete_p(int grp_num) {
		
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		
		try {
			
			result = sqlSession.delete("setReplyDelete_p",grp_num);
			sqlSession.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}

	//부모댓삭제
	public int setReplyDeleteBoardNo(int no) {
		
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		
		try {
			
			result = sqlSession.delete("setReplyDeleteBoardNo",no);
			sqlSession.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		return result;
	}
	
	
	
}
