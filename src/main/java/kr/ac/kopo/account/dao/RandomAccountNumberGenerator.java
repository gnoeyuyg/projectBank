package kr.ac.kopo.account.dao;

import java.security.SecureRandom;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class RandomAccountNumberGenerator {

    @Autowired
    private AccountDAO accountDAO;

    private static final int RANDOM_NUMBER_LENGTH = 9;

    public String generateRandomAccountNumber() {
        SecureRandom secureRandom = new SecureRandom();
        String accountNumber;
        do {
            StringBuilder sb = new StringBuilder("9900"); // 앞 4자리를 9900으로 고정

            // 뒷 9자리의 랜덤 숫자 생성
            for (int i = 0; i < 9; i++) {
                sb.append(secureRandom.nextInt(10));
            }

            accountNumber = sb.toString();
        } while (accountDAO.countByAccountNumber(accountNumber) > 0); // 중복 검사

        return accountNumber;
    }

    public String generateRandomSavingsAccountNumber(int productNumber) {
        SecureRandom secureRandom = new SecureRandom();
        String accountNumber;
        do {
            StringBuilder sb = new StringBuilder();

            // 앞 두 자리는 99로 고정
            sb.append("99");

            // 다음 두 자리는 product_number의 값을 사용
            String productNumberStr = String.format("%02d", productNumber);
            sb.append(productNumberStr);

            // 나머지 9자리의 랜덤 숫자 생성
            for (int i = 0; i < RANDOM_NUMBER_LENGTH; i++) {
                sb.append(secureRandom.nextInt(10));
            }

            accountNumber = sb.toString();
        } while (accountDAO.countBySavingsAccountNumber(accountNumber) > 0); // 중복 검사

        return accountNumber;
    }
}
