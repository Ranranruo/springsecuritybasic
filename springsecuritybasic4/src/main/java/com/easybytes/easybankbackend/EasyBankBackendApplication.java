package com.easybytes.easybankbackend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
//@ComponentScan("com.easybytes.easybankbackend.controller") // Optional
// 현재는 스프링부트 메인 클래스 안에 파일을 만들어서 괜찮지만 만약 메인 클래스 밖에 파일을 만들게 되면 @ComponentScan 으로 스캔해줘야 한다.
public class EasyBankBackendApplication {
	public static void main(String[] args) {
		SpringApplication.run(EasyBankBackendApplication.class, args);
	}

}
