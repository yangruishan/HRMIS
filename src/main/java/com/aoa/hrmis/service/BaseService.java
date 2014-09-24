package com.aoa.hrmis.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.aoa.hrmis.domain.BaseEntity;
import com.aoa.hrmis.persistence.BaseMapper;

public abstract class BaseService {

	protected BaseEntity findEntityById(BaseMapper mapper,long id) {
	    return mapper.findEntityById(id);
	  }

	@SuppressWarnings("unchecked")
	protected List<BaseEntity> getAllEntities(BaseMapper mapper) {
	    return (List<BaseEntity>)mapper.getAllEntities();
	  }

	@Transactional
	protected void insertEntity(BaseMapper mapper,BaseEntity entity) {
	    mapper.insertEntity(entity);
	  }

	@Transactional
	protected void updateEntity(BaseMapper mapper,BaseEntity entity) {
	    mapper.updateEntity(entity);
	  }

	@Transactional
	protected void deleteEntity(BaseMapper mapper,BaseEntity entity) {
		long id = entity.getId();
	    mapper.deleteEntity(id);
	  }

	// protected BaseMapper baseMapper;

	// protected BaseMapper getBaseMapper() {
	// 	return baseMapper;
	// }

	// protected void setBaseMapper(BaseMapper baseMapper) {
	// 	this.baseMapper = baseMapper;
	// }

}