package spring.repository;

import org.springframework.stereotype.Service;

import spring.entity.MemberDto;

@Service
public interface MemberDao {
	void insert(MemberDto memberDto);
	void find(MemberDto memberDto);
}
