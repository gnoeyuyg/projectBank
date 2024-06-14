package kr.ac.kopo.transaction.service;

import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.transaction.dao.TransactionDAO;
import kr.ac.kopo.transaction.vo.TransactionVO;

@Service
public class TransactionServiceImpl implements TransactionService {

    @Autowired
    private TransactionDAO transactionDao;

    @Transactional
    @Override
    public void transfer(TransactionVO transaction) {
        try {
        	// 랜덤한 transaction_id 생성
            Random random = new Random();
            int transactionId = random.nextInt(1000000);
            transaction.setTransactionId(transactionId);

            // 현재 날짜 설정
            Date now = new Date();
            java.sql.Date sqlDate = new java.sql.Date(now.getTime());
            transaction.setTransactionDate(sqlDate);

            // 출금 및 입금 처리
            transactionDao.decreaseBalance(transaction);
            transactionDao.increaseBalance(transaction);

            // 거래내역 삽입
            /*transactionDao.insertTransactionDetails(transaction);*/
        } catch (Exception e) {
            // 예외 발생 시 전체 트랜잭션을 롤백
            throw new RuntimeException("계좌 이체 중 오류 발생: " + e.getMessage(), e);
        }
    }
}
