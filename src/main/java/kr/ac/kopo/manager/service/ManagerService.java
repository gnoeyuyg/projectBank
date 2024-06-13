package kr.ac.kopo.manager.service;

import kr.ac.kopo.manager.vo.ManagerVO;

public interface ManagerService {
    ManagerVO login(ManagerVO manager) throws Exception;
}
