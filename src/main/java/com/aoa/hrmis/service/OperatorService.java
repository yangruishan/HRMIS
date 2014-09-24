package com.aoa.hrmis.service;

import com.aoa.hrmis.domain.Operator;
import com.aoa.hrmis.persistence.OperatorMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OperatorService{

  @Autowired
  private OperatorMapper operatorMapper;
  
  public Operator getOperatorByAccountAndPassword(String account,String password) {
    return operatorMapper.getOperatorByAccountAndPassword(account, password);
  }
	
  // public Operator findOperatorById(int id) {
  //   return (Operator)operatorMapper.findEntityById(id);
  // }

  // @SuppressWarnings("unchecked")
  // public List<Operator> getAllOperators() {
  //   return (List<Operator>)operatorMapper.getAllEntities();
  // }

  // @Transactional
  // public void insertOperator(Operator entity) {
  // 	operatorMapper.insertEntity(entity);
  // }

  // @Transactional
  // public void updateOperator(Operator entity) {
  // 	operatorMapper.updateEntity(entity);
  // }

  // @Transactional
  // public void deleteOperator(Operator entity) {
  // 	long id = entity.getId();
  // 	operatorMapper.deleteEntity(id);
  // }
}