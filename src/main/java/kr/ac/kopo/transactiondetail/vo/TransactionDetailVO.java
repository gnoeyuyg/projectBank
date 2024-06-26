package kr.ac.kopo.transactiondetail.vo;

import java.math.BigDecimal;
import java.util.Date;

public class TransactionDetailVO {
    private int transactionId;
    private String accountNum;

	private double amount;
    private String transaction_type;
    private Date transactionDate;
    private String depositorName;
    private String toAccount;
    private String fromAccount;
    private String transactionType;
	public int getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}
	public String getAccountNum() {
		return accountNum;
	}
	public void setAccountNum(String accountNum) {
		this.accountNum = accountNum;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getTransaction_type() {
		return transaction_type;
	}
	public void setTransaction_type(String transaction_type) {
		this.transaction_type = transaction_type;
	}
	public Date getTransactionDate() {
		return transactionDate;
	}
	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}
	public String getDepositorName() {
		return depositorName;
	}
	public void setDepositorName(String depositorName) {
		this.depositorName = depositorName;
	}
	public String getToAccount() {
		return toAccount;
	}
	public void setToAccount(String toAccount) {
		this.toAccount = toAccount;
	}
	public String getFromAccount() {
		return fromAccount;
	}
	public void setFromAccount(String fromAccount) {
		this.fromAccount = fromAccount;
	}
	public String getTransactionType() {
		return transactionType;
	}
	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
	}
	@Override
	public String toString() {
		return "TransactionDetailVO [transactionId=" + transactionId + ", accountNum=" + accountNum + ", amount="
				+ amount + ", transaction_type=" + transaction_type + ", transactionDate=" + transactionDate
				+ ", depositorName=" + depositorName + ", toAccount=" + toAccount + ", fromAccount=" + fromAccount
				+ ", transactionType=" + transactionType + "]";
	}
	public TransactionDetailVO() {
		super();
		// TODO Auto-generated constructor stub
	}
  


}
