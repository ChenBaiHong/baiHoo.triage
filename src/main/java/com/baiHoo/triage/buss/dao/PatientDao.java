package com.baiHoo.triage.buss.dao;

import org.springframework.stereotype.Repository;

import com.baiHoo.triage.buss.entity.Patient;
import com.baiHoo.triage.common.persistence.HibernateDao;

/**
 * 
 *<p>Title: PatientDao</p>
 *<p>Description: 
 *	患者DAO
 *</p>
 *<p>Company: www.baiHoo.com</p> 
 * @author baiHoo.chen
 * @date 2017年4月10日
 */
@Repository
public class PatientDao extends HibernateDao<Patient, Integer>{

}
