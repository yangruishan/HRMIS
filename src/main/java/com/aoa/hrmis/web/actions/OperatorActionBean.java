package com.aoa.hrmis.web.actions;

import java.util.List;

import javax.servlet.http.HttpSession;

import net.sourceforge.stripes.action.DefaultHandler;
import net.sourceforge.stripes.action.ForwardResolution;
import net.sourceforge.stripes.action.RedirectResolution;
import net.sourceforge.stripes.action.Resolution;
import net.sourceforge.stripes.action.SessionScope;
import net.sourceforge.stripes.integration.spring.SpringBean;
import net.sourceforge.stripes.validation.Validate;

import com.aoa.hrmis.domain.Operator;
import com.aoa.hrmis.service.OperatorService;

@SessionScope
public class OperatorActionBean extends AbstractActionBean {

  private static final long serialVersionUID = 420877698788422478L;
  private static final String SIGNON = "/WEB-INF/index.jsp";
  private static final String MAIN = "/WEB-INF/jsp/Main.jsp";

  @SpringBean
  private transient OperatorService operatorService;

  private Operator operator = new Operator();
  private List<Operator> operatorList;
  private boolean authenticated;

  public Resolution signonForm() {
    return new ForwardResolution(MAIN);
  }

  @DefaultHandler
  public Resolution signon() {

    operator = operatorService.getOperatorByAccountAndPassword(getAccount(), getPassword());
    
    if (operator == null) {
      String value = "无效的用户名或者密码，请重新登录！！！";
      setMessage(value);
      clear();
      return new ForwardResolution(SIGNON);
    } else {
      //operator.setPassword(null);
      authenticated = true;
      
      HttpSession s = context.getRequest().getSession();
      //this bean is already registered as /actions/Operator.action
      s.setAttribute("operatorBean", this);
      //return new RedirectResolution(WelcomeActionBean.class);
      return new RedirectResolution(MAIN);
    }
  }
	  
  public boolean isAuthenticated() {
    return authenticated && operator != null && operator.getAccount() != null;
  }

  private void clear() {
    operator = new Operator();
    operatorList = null;
    authenticated = false;
  }

  public String getAccount() {
    return operator.getAccount();
  }

  @Validate(required=true, on={"signon"})
  public void setAccount(String account) {
    operator.setAccount(account);
  }

  public String getPassword() {
    return operator.getPassword();
  }

  @Validate(required=true, on={"signon"})
  public void setPassword(String password) {
    operator.setPassword(password);
  }
  
  public Operator getOperator() {
    return this.operator;
  }

  public void setOperator(Operator operator) {
    this.operator = operator;
  }

  public List<Operator> getOperatorList() {
    return operatorList;
  }

  public void setOperatorList(List<Operator> list) {
    this.operatorList = list;
  }

}
