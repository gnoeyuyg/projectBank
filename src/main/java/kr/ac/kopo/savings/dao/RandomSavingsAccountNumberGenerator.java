package kr.ac.kopo.savings.dao;

import java.security.SecureRandom;

public class RandomSavingsAccountNumberGenerator {

    private static final int RANDOM_NUMBER_LENGTH = 9;

    public static String generateRandomAccountNumber(int productNumber) {
        StringBuilder sb = new StringBuilder();
        SecureRandom secureRandom = new SecureRandom();

        // 앞 두 자리는 99로 고정
        sb.append("99");

        // 다음 두 자리는 product_number의 값을 사용
        String productNumberStr = String.format("%02d", productNumber);
        sb.append(productNumberStr);

        // 나머지 9자리의 랜덤 숫자 생성
        for (int i = 0; i < RANDOM_NUMBER_LENGTH; i++) {
            sb.append(secureRandom.nextInt(10));
        }

        return sb.toString();
    }

}
