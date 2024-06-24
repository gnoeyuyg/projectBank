package kr.ac.kopo.account.dao;

import java.security.SecureRandom;

public class RandomAccountNumberGenerator {

    private static final int RANDOM_NUMBER_LENGTH = 9;

    public static String generateRandomAccountNumber() {
        StringBuilder sb = new StringBuilder();
        SecureRandom secureRandom = new SecureRandom();

        // 앞 두 자리는 99로 고정
        sb.append("99");

        // 다음 두 자리는 일반 계좌의 번호인 05로 고정
        sb.append("05");

        // 나머지 9자리의 랜덤 숫자 생성
        for (int i = 0; i < RANDOM_NUMBER_LENGTH; i++) {
            sb.append(secureRandom.nextInt(10));
        }

        return sb.toString();
    }
}
