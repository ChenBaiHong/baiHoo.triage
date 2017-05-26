package com.baiHoo.triage.system.dao;

import org.springframework.stereotype.Repository;

import com.baiHoo.triage.common.persistence.HibernateDao;
import com.baiHoo.triage.system.entity.User;

/**
 * 
 *<p>Title: UserDao</p>
 *<p>Description: 
 *
 * 用户DAO
 * 
 *</p>
 *<p>Company: www.baiHoo.com</p> 
 * @author baiHoo.chen
 * @date 2017年4月10日
 */
@Repository
public class UserDao extends HibernateDao<User, Integer>{

}
