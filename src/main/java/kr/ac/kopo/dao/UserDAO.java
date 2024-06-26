package kr.ac.kopo.dao;

public interface UserDAO {
    int countByCustomerId(String customerId);
    int countByEmail(String email);
    int countByPhoneNumber(String phoneNumber);
    int countBySSN(String ssn);
}
