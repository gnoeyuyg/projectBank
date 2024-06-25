package kr.ac.kopo.customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    public boolean isEmailAvailable(String email) {
        Customer customer = customerRepository.findByEmail(email);
        return customer == null;
    }
}
