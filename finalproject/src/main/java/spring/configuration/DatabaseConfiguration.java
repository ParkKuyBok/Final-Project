package spring.configuration;
/*
 * 설정 파일은 @Configuration으로 등록한다
 *  - 반드시 Component-scan이 작동해야 한다(application-config.xml)
 */

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
@PropertySource("classpath:/properties/db.properties")
public class DatabaseConfiguration {

	/*
	 * Bean을 등록하려면 @Bean을 사용한다
	 */
//	public 결과물자료형 아이디(설정할데이터...){}
	
	//모든 property
	@Autowired
	private Environment env;	
	
	@Bean
	public DataSource dataSource() {
		DriverManagerDataSource datasource = new DriverManagerDataSource();
		datasource.setDriverClassName(env.getProperty("jdbc.driver"));
		datasource.setUrl(env.getProperty("jdbc.url"));
		datasource.setUsername(env.getProperty("jdbc.username"));
		datasource.setPassword(env.getProperty("jdbc.password"));
		return datasource;
	}
	
	@Bean
	public JdbcTemplate jdbcTemplate(DataSource dbcpSource) {
		JdbcTemplate jdbcTemplate = new JdbcTemplate();
		jdbcTemplate.setDataSource(dbcpSource);
		return jdbcTemplate;
	}
}
