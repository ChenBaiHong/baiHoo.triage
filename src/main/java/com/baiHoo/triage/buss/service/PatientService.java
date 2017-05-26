package com.baiHoo.triage.buss.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.baiHoo.triage.buss.dao.PatientDao;
import com.baiHoo.triage.buss.entity.Patient;
import com.baiHoo.triage.common.persistence.HibernateDao;
import com.baiHoo.triage.common.service.BaseService;

/**
 * 
 *<p>Title: PatientService</p>
 *<p>Description: 患者service</p>
 *<p>Company: www.baiHoo.com</p> 
 * @author baiHoo.chen
 * @date 2017年4月10日
 */
@Service
@Transactional(readOnly = true)
public class PatientService extends BaseService<Patient, Integer> {
	
	/**加密方法*/
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	private static final int SALT_SIZE = 8;	//盐长度

	@Autowired
	private PatientDao patientDao;

	@Override
	public HibernateDao<Patient, Integer> getEntityDao() {
		return patientDao;
	}

	/**
	 * 保存患者
	 * @param patient
	 */
	@Transactional(readOnly=false)
	public void save(Patient patient) {
		patientDao.save(patient);
	}

	
	/**
	 * 删除患者
	 * @param id
	 */
	@Transactional(readOnly=false)
	public void delete(Integer id){
		if(!isSupervisor(id))
			patientDao.delete(id);
	}
	
	
	/**
	 * 判断是否超级管理员
	 * @param id
	 * @return boolean
	 */
	private boolean isSupervisor(Integer id) {
		return id == 1;
	}
	
	
	
}
