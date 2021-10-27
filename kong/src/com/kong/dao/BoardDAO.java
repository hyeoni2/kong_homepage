package com.kong.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kong.dto.BoardDTO;
import com.kong.dto.MemberDTO;
import com.kong.dto.PageingDTO;
import com.kong.mybatis.sqlMapConfig;

public class BoardDAO {

SqlSessionFactory sqlSessionFactory = sqlMapConfig.getSqlSession();
	
	//mapper에 접근 하기 위한 sqlSession
	SqlSession sqlSession;
	
	
	private BoardDAO() {}
	
	private static BoardDAO instance = new BoardDAO();
	
	
	public static BoardDAO getInstance() {
		return instance;
	}
	
	
	/************************************************************/
	
	//추가
	public int setInsertBoard(BoardDTO dto) {

		sqlSession = sqlSessionFactory.openSession();

		int result = 0;
		
		try {
			System.out.println(dto.toString());
			
			result = sqlSession.insert("boardInsert",dto);
			sqlSession.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	//업데이트
	public int setupdateBoard(BoardDTO dto) {

		sqlSession = sqlSessionFactory.openSession();

		int result = 0;
		
		try {
			System.out.println(dto.toString());
			
			result = sqlSession.update("updateBoard",dto);
			sqlSession.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
	public List<BoardDTO> getSelectAll(){
		
		sqlSession = sqlSessionFactory.openSession();
		
		List<BoardDTO> list = new ArrayList<>();
		
		BoardDTO dto = new BoardDTO();
		
		try {
			
			list = sqlSession.selectList("getSelectAll", dto);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
	}

	
	public List<BoardDTO> getPggeSelectAll(PageingDTO page){
		
		sqlSession = sqlSessionFactory.openSession();
		
		List<BoardDTO> list = new ArrayList<>();
		
		BoardDTO dto = new BoardDTO();
		
		try {
			
			list = sqlSession.selectList("PagingListAll", page);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return list;
	}
	
	public int totalCount(PageingDTO page){
		
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
				
		try {
			
			result = sqlSession.selectOne("PageCount", page);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	

	public int updateSearchNum(int no){
		
		sqlSession = sqlSessionFactory.openSession();
		int result = 0;
		
		try {
			
			result = sqlSession.update("updateCount", no);
			sqlSession.commit();
			
		}catch (Exception e) {
			
			e.printStackTrace();
			
		}finally {
			
			sqlSession.close();
		}
		
		return result;

	}
	
	
	public BoardDTO getSelectOne(BoardDTO dto){
		
		sqlSession = sqlSessionFactory.openSession();
		
		try {
			
			dto = sqlSession.selectOne("getSelectOne", dto);
			sqlSession.commit();
			
		}catch (Exception e) {
			
			e.printStackTrace();
			
		}finally {
			
			sqlSession.close();
		}
		
		return dto;
	}
	

	
	//삭제
	public int setDeleteBoard(int no) {
		
		sqlSession = sqlSessionFactory.openSession();
		
		int result = 0;
		
		try {
			
			result = sqlSession.delete("setDelete",no);
			
			sqlSession.commit();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	
	
}
