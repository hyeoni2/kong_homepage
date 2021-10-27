package com.kong.mybatis;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class sqlMapConfig {
	
	private static SqlSessionFactory sqlSessionFactory; //mybatise 핵심. 없으면 안돌아감. 변수 선언 
	
	static {
		String resource = "com/kong/mybatis/Configuration.xml"; //xml은 자바코드가 아니라 불러서 읽은거임. 
		//configuration 안에는 db.propertis가 들어있다.
		
		try {//DB와 입출력(IO)할때 예외처리 필요. 지금은 IO
			Reader reader = Resources.getResourceAsReader(resource); //(resource)를 읽어서 소스를 줘 라는 의미(getResourceAsReader)
			//reader로 자바 코드 읽음
			
			if(sqlSessionFactory == null) { //만약 마이바티스를 사용하고 있지 않다면 
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
				//객체 생성을 할 건데 어떤 값으로 할 거냐면 (reader), 즉 마이바티스의 환경설정 3개가 들어있는걸 가지고 하겠다.
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static SqlSessionFactory getSqlSession() { //getSqlSession을 호출하면 마이바티스를 사용할 수 있게 되는 것!
		return sqlSessionFactory;
	}
}


