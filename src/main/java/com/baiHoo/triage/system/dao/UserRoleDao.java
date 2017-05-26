package com.baiHoo.triage.system.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.baiHoo.triage.common.persistence.HibernateDao;
import com.baiHoo.triage.system.entity.UserRole;

/**
 * 
 *<p>Title: UserRoleDao</p>
 *<p>Description: 
 *
 * 用户角色DAO
 *
 *</p>
 *<p>Company: www.baiHoo.com</p> 
 * @author baiHoo.chen
 * @date 2017年4月10日
 */
@Repository
public class UserRoleDao extends HibernateDao<UserRole, Integer>{

	/**
	 * 删除用户角色
	 * @param userId
	 * @param roleId
	 */
	public void deleteUR(Integer userId,Integer roleId){
		String hql="delete UserRole ur where ur.user.id=?0 and ur.role.id=?1";
		batchExecute(hql, userId,roleId);
	}
	
	/**
	 * 查询用户拥有的角色id集合
	 * @param userId
	 * @return 结果集合
	 */
	@SuppressWarnings("unchecked")
	public List<Integer> findRoleIds(Integer userId){
		String hql="select ur.role.id from UserRole ur where ur.user.id=?0";
		Query query= createQuery(hql, userId);
		return query.list();
	}
	
}
