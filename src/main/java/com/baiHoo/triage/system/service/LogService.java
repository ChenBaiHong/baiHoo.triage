package com.baiHoo.triage.system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baiHoo.triage.common.persistence.HibernateDao;
import com.baiHoo.triage.common.service.BaseService;
import com.baiHoo.triage.system.dao.LogDao;
import com.baiHoo.triage.system.entity.Log;

/**
 * 
 *<p>Title: LogService</p>
 *<p>Description: 日志service</p>
 *<p>Company: www.baiHoo.com</p> 
 * @author baiHoo.chen
 * @date 2017年4月10日
 */
@Service
@Transactional(readOnly=true)
public class LogService extends BaseService<Log, Integer> {
	
	@Autowired
	private LogDao logDao;
	
	@Override
	public HibernateDao<Log, Integer> getEntityDao() {
		return logDao;
	}
	/**
	 * 批量删除日志
	 * @param idList
	 */
	@Transactional(readOnly=false)
	public void deleteLog(List<Integer> idList){
		logDao.deleteBatch(idList);
	}
	
}
