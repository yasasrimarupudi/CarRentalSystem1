package com.infosys.CarRentalSystem.bean;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
@Entity
public class CarBooking {
	@Id
	private String bookingId;
	private String username;
	private String license;
	private String carNumber;
	private String variantId;
	private String rentRate;
	private String fromDate;
	private String toDate;
	private Double totalPayment;
	private Double advancePayment;
	private Double pendingPayment;
	private String transactionId;
	private String status;  // "P"-->pending , "C"--> cancelled, "R"-->Returned
	public CarBooking(String bookingId, String username,String license, String carNumber, String variantId,String rentRate , String fromDate, String toDate,
			Double totalPayment, Double advancePayment, Double pendingPayment,String transactionId, String status) {
		super();
		this.bookingId = bookingId;
		this.username = username;
		this.license = license;
		this.carNumber=carNumber;
		this.variantId = variantId;
		this.rentRate=rentRate;
		this.fromDate = fromDate;
		this.toDate = toDate;
		this.totalPayment = totalPayment;
		this.advancePayment = advancePayment;
		this.pendingPayment = pendingPayment;
		this.transactionId = transactionId;
		this.status = status;
	}
	public CarBooking(String bookingId, String username, String license, String carNumber, String variantId) {
		super();
		this.bookingId = bookingId;
		this.status= "P";
		this.pendingPayment = 0.0;
		this.transactionId="";
		this.totalPayment=0.0;
		this.username=username;
		this.carNumber=carNumber;
		this.variantId=variantId;
		this.license = license;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getCarNumber() {
		return carNumber;
	}
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}
	public CarBooking() {
		// TODO Auto-generated constructor stub
	}
	public String getBookingId() {
		return bookingId;
	}
	public void setBookingId(String bookingId) {
		this.bookingId = bookingId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getVariantId() {
		return variantId;
	}
	public void setVariantId(String variantId) {
		this.variantId = variantId;
	}
	public String getFromDate() {
		return fromDate;
	}
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}
	public String getToDate() {
		return toDate;
	}
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
	public Double getTotalPayment() {
		return totalPayment;
	}
	public void setTotalPayment(Double totalPayment) {
		this.totalPayment = totalPayment;
	}
	public Double getAdvancePayment() {
		return advancePayment;
	}
	public void setAdvancePayment(Double advancePayment) {
		this.advancePayment = advancePayment;
	}
	public Double getPendingPayment() {
		return pendingPayment;
	}
	public void setPendingPayment(Double pendingPayment) {
		this.pendingPayment = pendingPayment;
	}
	public String getTransactionId() {
		return transactionId;
	}
	public void setTransactionId(String transactionId) {
		this.transactionId = transactionId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String b) {
		this.status = b;
	}
	@Override
	public String toString() {
		return "CarBooking [bookingId=" + bookingId + ", username=" + username + ", license=" + license + ", carNumber="
				+ carNumber + ", variantId=" + variantId + ", fromDate=" + fromDate + ", toDate=" + toDate
				+ ", totalPayment=" + totalPayment + ", advancePayment=" + advancePayment + ", pendingPayment="
				+ pendingPayment + ", transactionId=" + transactionId + ", status=" + status + "]";
	}
	public String getRentRate() {
		// TODO Auto-generated method stub
		return rentRate;
	}
	public void setRentRate() {
		this.rentRate = rentRate;
	}
	
}