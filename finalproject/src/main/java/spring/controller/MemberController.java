package spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.entity.MemberDto;
import spring.repository.MemberDao;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberDao memberDao;
	
	@GetMapping("/regist")
	public String regist() {
		return "member/regist";
	}
	@PostMapping("/regist")
	public String regist(@ModelAttribute MemberDto memberDto ) {
		memberDao.insert(memberDto);
		return "redirect:/home";
	}
	
	@GetMapping("/login")
	public String login() {
		return "member/login";
	}
	@PostMapping("/login")
	public String login(@ModelAttribute MemberDto memberDto) {
		memberDao.find(memberDto);
		return "redirect:/home";
	}
}
