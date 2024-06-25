package kr.ac.kopo.customer;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Date;

@Entity
@Table(name = "customers")
public class Customer {

    @Id
    @Column(name = "customer_id", length = 255, nullable = false, unique = true)
    @Size(max = 255)
    @NotNull
    private String customerId;

    @Column(name = "customer_name", length = 50, nullable = false)
    @Size(max = 50)
    @NotNull
    private String customerName;

    @Column(name = "password", length = 255, nullable = false)
    @Size(max = 255)
    @NotNull
    private String password;

    @Column(name = "SSN", length = 13, nullable = false, unique = true)
    @Size(max = 13)
    @Pattern(regexp = "^[0-9]{13}$", message = "SSN must be 13 digits numeric")
    @NotNull
    private String ssn;

    @Column(name = "address", length = 255, nullable = false)
    @Size(max = 255)
    @NotNull
    private String address;

    @Column(name = "phone_number", length = 15, nullable = false, unique = true)
    @Size(max = 15)
    @Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "Invalid phone number format")
    @NotNull
    private String phoneNumber;

    @Column(name = "email", length = 100, unique = true)
    @Size(max = 100)
    @Email(message = "Invalid email format")
    private String email;

    @Column(name = "reg_date", columnDefinition = "DATE DEFAULT sysdate", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date regDate;

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSsn() {
		return ssn;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", customerName=" + customerName + ", password=" + password
				+ ", ssn=" + ssn + ", address=" + address + ", phoneNumber=" + phoneNumber + ", email=" + email
				+ ", regDate=" + regDate + "]";
	}

	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}

    // Constructor, getters, setters, and additional logic
    
}
