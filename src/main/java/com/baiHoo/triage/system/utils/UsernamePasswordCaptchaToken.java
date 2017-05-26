package com.baiHoo.triage.system.utils;


import org.apache.shiro.authc.UsernamePasswordToken;

/**
 * 
 *<p>Title: UsernamePasswordCaptchaToken</p>
 *<p>Description: 扩展添加验证码-继承用户验证类</p>
 *<p>Company: www.baiHoo.com</p> 
 * @author baiHoo.chen
 * @date 2017年4月10日
 */
public class UsernamePasswordCaptchaToken extends UsernamePasswordToken {

	private static final long serialVersionUID = 1L;

	private String captcha;

	public String getCaptcha() {
		return captcha;
	}

	public void setCaptcha(String captcha) {
		this.captcha = captcha;
	}

	public UsernamePasswordCaptchaToken() {
		super();
	}

	public UsernamePasswordCaptchaToken(String username, char[] password,boolean rememberMe, String host, String captcha) {
		super(username, password, rememberMe, host);
		this.captcha = captcha;
	}

}