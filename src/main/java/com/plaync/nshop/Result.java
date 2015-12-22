package com.plaync.nshop;

import org.springframework.stereotype.Component;


@Component
public class Result<T> {

	String message;
	T data;
	
	
	public Result(String message) {
		this.message = message;
	}

	public Result(T data) {
		this.message = "SUCCESS";
		this.data = data;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

}
