package org.spring.service;

import org.apache.ibatis.annotations.Param;
import org.spring.domain.RegisterDTO;
import org.spring.domain.UserDTO;
import org.spring.persistence.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public UserDTO login(String user_email, String user_pw) {
		return userMapper.validateUser(user_email,user_pw) ;
	}
	
	public void register(RegisterDTO user) {
		userMapper.registerUser(user);
	}

	//naver
	public void saveUser(UserDTO user) {
    	userMapper.insertUser(user);
    }

	//google
    @Transactional
    public void insertOrUpdate(UserDTO dto) {
        userMapper.insertOrUpdate(dto);
    }
    
    // 아이디 중복 확인
	public boolean isIdDuplicated(String user_email) {
		log.info("아이디 중복 확인");
		return userMapper.checkId(user_email);
	}
	
	// 이름 번호로 아이디 찾기
	public String searchId(String user_name, String user_phone) {
		log.info("아이디 찾기");
		return userMapper.searchId(user_name, user_phone);
	}
}
