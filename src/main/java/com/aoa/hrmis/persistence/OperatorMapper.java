package com.aoa.hrmis.persistence;

import com.aoa.hrmis.domain.Operator;

/**
 * @author 
 *
 */
public interface OperatorMapper extends BaseMapper{

  Operator getOperatorByAccountAndPassword(String account, String password);
  
}
