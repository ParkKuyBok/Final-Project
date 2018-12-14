package spring.configuration;

import java.io.IOException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/*
 * 마이바티스 설정파일
 * [1] SqlSessionFactoryBean			생성 공장, Mybatis의 모든 설정들을 생성하는 bean
 * [2] SqlSessionTemplate				인쇄기, Mybatis를 실제로 사용할 때 쓰는 도구
 */

@Configuration
public class MybatisConfiguration {
	
	@Bean
	public SqlSessionFactoryBean sqlSessionFactory(
			DataSource dataSource, ApplicationContext context) throws IOException {
		SqlSessionFactoryBean factory = new SqlSessionFactoryBean();
//		[1] DB연결 방식은 어떻게 됩니까? 라는 것을 알려줘야한다
//		-> dataSource라는 아이디를 참조하세요
		factory.setDataSource(dataSource);
//		[2] mybatis 운영 설정은 어느 파일에서 합니까?
//		-> ApplicationContext context 생성해서 경로를 resource 형태로 변환
		factory.setConfigLocation(
				context.getResource("classpath:/mybatis/mybatis-config.xml"));
//		[3] 어느 파일에 SQL 명령이 있습니까?
		factory.setMapperLocations(
				context.getResources("classpath:/mybatis/mapper/*-mapper.xml"));
		return factory;
	}
	
	@Bean
	public SqlSessionTemplate sqlSession(SqlSessionFactory sqlSessionFactory) {
		SqlSessionTemplate template = new SqlSessionTemplate(sqlSessionFactory);
		return template;
	}
}
