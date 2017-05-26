package com.baiHoo.triage.system.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.baiHoo.triage.common.persistence.HibernateDao;
import com.baiHoo.triage.system.entity.Log;

/**
 * 
 *<p>Title: LogDao</p>
 *<p>Description: 
 *
 * 日志DAO
 * 
 *</p>
 *<p>Company: www.baiHoo.com</p> 
 * @author baiHoo.chen
 * @date 2017年4月10日
 */
@Repository
public class LogDao extends HibernateDao<Log, Integer>{
	
	/**
	 * 批量删除日志
	 * @param ids 日志id列表
	 */
	public void deleteBatch(List<Integer> idList){
		String hql="delete from Log log where log.id in (:idList)";
		Query query=getSession().createQuery(hql);
		query.setParameterList("idList", idList);
		query.executeUpdate();
	}
}
