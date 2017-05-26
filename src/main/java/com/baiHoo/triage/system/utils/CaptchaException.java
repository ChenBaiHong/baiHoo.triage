package com.baiHoo.triage.system.utils;

import org.apache.shiro.authc.AuthenticationException;

/**
 * 
 *<p>Title: CaptchaException</p>
 *<p>Description: 验证码异常类</p>
 *<p>Company: www.baiHoo.com</p> 
 * @author baiHoo.chen
 * @date 2017年4月10日
 */
public class CaptchaException extends AuthenticationException {

	private static final long serialVersionUID = 1L;

	public CaptchaException() {
		super();
	}

	public CaptchaException(String message, Throwable cause) {
		super(message, cause);
	}

	public CaptchaException(String message) {
		super(message);
	}

	public CaptchaException(Throwable cause) {
		super(cause);
	}
}