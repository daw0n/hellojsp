package com.jsp.ex;

import java.util.ArrayList;

public class MemberAllService implements Service {
	public ArrayList<MemberDto> execute() {
		MemberDao dao = MemberDao.getInstance();		
		return dao.memberAll();
	}

}
