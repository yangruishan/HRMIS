/**
 * 
 */
package com.aoa.hrmis.persistence;

import java.util.List;

import com.aoa.hrmis.domain.BaseEntity;

/**
 * @author douglas
 *
 */
public interface BaseMapper {

	  BaseEntity findEntityById(long id);

	  List<?> getAllEntities();

	  void insertEntity(BaseEntity entity);

	  void updateEntity(BaseEntity entity);

	  void deleteEntity(long id);

}
