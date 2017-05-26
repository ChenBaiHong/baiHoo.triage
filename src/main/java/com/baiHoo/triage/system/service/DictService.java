package com.baiHoo.triage.system.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baiHoo.triage.common.persistence.HibernateDao;
import com.baiHoo.triage.common.service.BaseService;
import com.baiHoo.triage.system.dao.DictDao;
import com.baiHoo.triage.system.entity.Dict;

/**
 * 
 *<p>Title: DictService</p>
 *<p>Description: 字典service</p>
 *<p>Company: www.baiHoo.com</p> 
 * @author baiHoo.chen
 * @date 2017年4月10日
 */
@Service
@Transactional(readOnly=true)
public class DictService extends BaseService<Dict, Integer> {
	
	@Autowired
	private DictDao dictDao;

	@Override
	public HibernateDao<Dict, Integer> getEntityDao() {
		return dictDao;
	}
}
