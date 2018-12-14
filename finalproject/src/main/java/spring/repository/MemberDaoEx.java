package spring.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.entity.MemberDto;

@Service("memberDao")
public class MemberDaoEx implements MemberDao{
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insert(MemberDto memberDto) {
		sqlSession.insert("memberDto.insert", memberDto);
	}

	@Override
	public void find(MemberDto memberDto) {
		sqlSession.selectList("memberDto.login", memberDto);
	}
	
}
