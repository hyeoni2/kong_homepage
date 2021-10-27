package com.kong.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.kong.mybatis.sqlMapConfig;

public class Testdao {
	
	SqlSessionFactory sqlSessionFactory = sqlMapConfig.getSqlSession();
	
	//mapper에 접근 하기 위한 sqlSession
	SqlSession sqlSession;
	
	
	private Testdao() {}
	
	private static Testdao instance = new Testdao();
	
	
	public static Testdao getInstance() {
		return instance;
	}
	
	public void all() {
		sqlSession = sqlSessionFactory.openSession();
	
		try {
			
		String result = sqlSession.selectOne("test");
		System.out.println(result);
		
		
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}

	}

}
