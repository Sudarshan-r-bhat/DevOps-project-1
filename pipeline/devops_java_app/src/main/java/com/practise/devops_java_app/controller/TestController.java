package com.practise.devops_java_app.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="api/v1", name="Test-Controller")
public class TestController {

	@RequestMapping(method=RequestMethod.GET, value="/welcome")
	public ResponseEntity<?> welcome() {
		String mssg = "<h2>Hello, Welcome to the DEVOPS Java Application! </h2>";
		ResponseEntity<String> re = new ResponseEntity<>(mssg, HttpStatus.OK);
		System.out.println("WELCOME API: responded with " + re);
		return re;
	}
}
