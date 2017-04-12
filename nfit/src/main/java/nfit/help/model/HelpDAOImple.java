package nfit.help.model;

import org.mybatis.spring.SqlSessionTemplate;

public class HelpDAOImple implements HelpDAO {

private SqlSessionTemplate sqlMap;
	
	public HelpDAOImple(SqlSessionTemplate sqlMap){
		super();
		this.sqlMap = sqlMap;
	}
	
	public String faqTop5() {
		// TODO Auto-generated method stub
		return null;
	}
}  

