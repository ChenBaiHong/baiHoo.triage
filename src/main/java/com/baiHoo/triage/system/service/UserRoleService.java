package com.baiHoo.triage.system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baiHoo.triage.common.persistence.HibernateDao;
import com.baiHoo.triage.common.service.BaseService;
import com.baiHoo.triage.system.dao.UserRoleDao;
import com.baiHoo.triage.system.entity.Role;
import com.baiHoo.triage.system.entity.User;
import com.baiHoo.triage.system.entity.UserRole;

/**
 * 
 *<p>Title: UserRoleService</p>
 *<p>Description: 用户角色service</p>
 *<p>Company: www.baiHoo.com</p> 
 * @author baiHoo.chen
 * @date 2017年4月10日
 */
@Service
@Transactional(readOnly = true)
public class UserRoleService extends BaseService<UserRole, Integer> {

	@Autowired
	private UserRoleDao userRoleDao;

	@Override
	public HibernateDao<UserRole, Integer> getEntityDao() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * 添加修改用户角色
	 * 
	 * @param id
	 * @param oldList
	 * @param newList
	 */
	@Transactional(readOnly = false)
	public void updateUserRole(Integer userId, List<Integer> oldList,List<Integer> newList) {
		// 是否删除
		for (int i = 0, j = oldList.size(); i < j; i++) {
			if (!newList.contains(oldList.get(i))) {
				userRoleDao.deleteUR(userId, oldList.get(i));
			}
		}

		// 是否添加
		for (int m = 0, n = newList.size(); m < n; m++) {
			if (!oldList.contains(newList.get(m))) {
				userRoleDao.save(getUserRole(userId, newList.get(m)));
			}
		}
	}

	/**
	 * 构建UserRole
	 * 
	 * @param userId
	 * @param roleId
	 * @return UserRole
	 */
	private UserRole getUserRole(Integer userId, Integer roleId) {
		UserRole ur = new UserRole();
		ur.setUser(new User(userId));
		ur.setRole(new Role(roleId));
		return ur;
	}

	/**
	 * 获取用户拥有角色id集合
	 * 
	 * @param userId
	 * @return 结果集合
	 */
	public List<Integer> getRoleIdList(Integer userId) {
		return userRoleDao.findRoleIds(userId);
	}

}
