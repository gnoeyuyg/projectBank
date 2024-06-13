package kr.ac.kopo.manager.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.manager.dao.ManagerDAO;
import kr.ac.kopo.manager.vo.ManagerVO;

@Service
public class ManagerServiceImpl implements ManagerService {

	@Autowired
	private ManagerDAO managerDao;
	
	@Override
	public ManagerVO login(ManagerVO manager) throws Exception {
		return managerDao.login(manager);
	}

}
