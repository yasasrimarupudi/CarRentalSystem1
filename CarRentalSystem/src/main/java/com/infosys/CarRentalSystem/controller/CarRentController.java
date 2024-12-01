package com.infosys.CarRentalSystem.controller;

import com.infosys.CarRentalSystem.bean.Car;
import com.infosys.CarRentalSystem.bean.CarBooking;
import com.infosys.CarRentalSystem.bean.Customer;
import com.infosys.CarRentalSystem.bean.Transaction;
import com.infosys.CarRentalSystem.bean.CarVariant;
import com.infosys.CarRentalSystem.dao.CarBookingDao;
import com.infosys.CarRentalSystem.dao.CarDao;
import com.infosys.CarRentalSystem.dao.CarUserRepository;
import com.infosys.CarRentalSystem.dao.CarVariantDao;
import com.infosys.CarRentalSystem.dao.CustomerDao;
import com.infosys.CarRentalSystem.dao.TransactionDao;
import com.infosys.CarRentalSystem.dao.TransactionRepository;
import com.infosys.CarRentalSystem.exception.CustomerLicenceException;
import com.infosys.CarRentalSystem.exception.CustomerStatusException;
import com.infosys.CarRentalSystem.service.CarUserService;
import com.infosys.CarRentalSystem.service.CustomerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class CarRentController {
    @Autowired
    private CarVariantDao carVariantDao;

    @Autowired
    private CarDao carDao;
    
    @Autowired
    private CustomerDao customerDao;
    
    @Autowired
    private CarUserRepository repository;

    @Autowired
    private CarUserService carUserService;
    
    @Autowired
    private CustomerService custService;
    
    @Autowired
    private CarBookingDao carBookingDao;
    
    @Autowired
    TransactionDao transactionDao;
    @Autowired
    private TransactionRepository transactionRepository;


    @GetMapping("/variantAdd")
    public ModelAndView showVariantEntryPage() {
        String newId = carVariantDao.generateVariantId();
        CarVariant carVariant = new CarVariant(newId);
        ModelAndView mv =  new ModelAndView("variantEntryPage");
        mv.addObject("variantRecord", carVariant);
        return mv;
    }
    @PostMapping("/variantAdd")
    public ModelAndView saveVariant(@ModelAttribute("variantRecord") CarVariant carVariant) {
        carVariantDao.save(carVariant);
        return new ModelAndView("redirect:/index");
    }

    @GetMapping("/variantReport")
    public ModelAndView showVariantReportPage() {
        List<CarVariant> variantList = carVariantDao.findAll();
        variantList.forEach(v-> System.out.println(v));
        ModelAndView mv = new ModelAndView("variantReportPage");
        mv.addObject("variantList", variantList);
        return mv;
    }
    @GetMapping("/variantDeletion/{id}")
    public ModelAndView deleteVariant(@PathVariable String id) {
        carVariantDao.deleteVariantById(id);
        return new ModelAndView("redirect:/variantReport");
    }

    @GetMapping("/carAdd")
    public ModelAndView showCarEntryPage() {
        Car car = new Car();
        List<String> variantIdList = carVariantDao.getAllVariantIds();
        ModelAndView mv = new ModelAndView("carEntryPage");
        mv.addObject("carRecord", car);
        mv.addObject("variantIdList", variantIdList);
        return mv;
    }

    @PostMapping("/carAdd")
    public ModelAndView saveCar(@ModelAttribute("carRecord") Car car) {
        carDao.save(car);
        return new ModelAndView("redirect:/index");
    }

    @GetMapping("/carReport")
    public ModelAndView showCarReportPage() {
        String role = carUserService.getRole();
        String page="";
        if(role.equalsIgnoreCase("Admin"))
            page = "carReportPage1";
        else if(role.equalsIgnoreCase("Customer"))
            page = "carReportPage2";

        List<Car> carList = carDao.findAll();
        List<CarVariant> variantList = carVariantDao.findAll();

        Map<String, CarVariant> variantMap = new HashMap<>();
        variantList.forEach(variant -> {
            variantMap.put(variant.getVariantId(), variant);
        });

        ModelAndView mv = new ModelAndView(page);

        mv.addObject("carList", carList);
        mv.addObject("variantMap", variantMap);

        return mv;
    }
    
    @GetMapping("/customerCarReport")
    public ModelAndView showCustomerCarReportPage() {
        // Get the username of the logged-in customer
        String username = carUserService.getUserName();
        String role=carUserService.getRole();
        if(role.equalsIgnoreCase("Customer")) {
        // Check customer status
        boolean status = customerDao.getCustomerStatusByUsername(username);
        if (!status) {
            throw new CustomerStatusException();
        }

        // Check license validity
        String licenceExpiryDate = customerDao.getLicenceExpiryDate(username);
        if (!custService.validateCustomerLicenceDate(licenceExpiryDate)) {
            throw new CustomerLicenceException();
        }
        }

        // Fetch available cars and car variants
        List<Car> carList = carDao.getAvailableCars();
        List<CarVariant> variantList = carVariantDao.findAll();
        
        // Create a mapping of variantId to CarVariant
        Map<String, CarVariant> variantMap = new HashMap<>();
        for (CarVariant cv : variantList) {
            variantMap.put(cv.getVariantId(), cv);
        }

        // Prepare the ModelAndView object
        ModelAndView mv = new ModelAndView("carReportPage2");
        mv.addObject("carList", carList);
        mv.addObject("variantMap", variantMap);

        return mv;
    }


    @GetMapping("/carDelete/{id}")
    public ModelAndView deleteCar(@PathVariable String id) {
        carVariantDao.deleteVariantById(id);
        return new ModelAndView("redirect:/carReport");
    }

    @GetMapping("/carUpdate/{id}")
    public ModelAndView updateCar(@PathVariable String id) {
        Car car = carDao.findById(id);
        ModelAndView mv = new ModelAndView("carUpdatePage");
        mv.addObject("carRecord", car);
        return mv;
    }
    
    @PostMapping("/carUpdate")
    public ModelAndView updateCarRecord(@ModelAttribute("carRecord") Car car) {
        // Update the car in the database
        carDao.save(car);
        // Redirect to the car report page
        return new ModelAndView("redirect:/carReport");
    }

    @GetMapping("/customerAdd")
    public ModelAndView showCustomerEntryPage() {
        String username = carUserService.getUserName();  // Get the username of the logged-in user
        String email = carUserService.getEmail();  // Get the email of the logged-in user

        // Initialize a new Customer object with username and email
        Customer customer = new Customer(username, email);  // Only passing username and email for now

        ModelAndView mv = new ModelAndView("customerEntryPage");
        mv.addObject("customerRecord", customer);  // Add customer to the model
        return mv;
    }

    // Handle form submission for adding a new customer
    @PostMapping("/customerAdd")
    public ModelAndView saveCustomer(@ModelAttribute("customerRecord") Customer customer) {
        customerDao.save(customer);  // Save customer to the database
        return new ModelAndView("redirect:/index");
    }

    // Show the customer report page
    @GetMapping("/customerReport")
    public ModelAndView showCustomerReportPage() {
        List<Customer> customerList = customerDao.findAll();// Fetch all customers from DB
        ModelAndView mv = new ModelAndView("customerReportPage");
        mv.addObject("customerList", customerList);  // Add list of customers to the model
        return mv;
    }
    @GetMapping("/singleCustomerReport")
    public ModelAndView showSingleCustomerReportPage() {
    	String username = carUserService.getUserName();
    	Customer customer = customerDao.findById(username);
    	ModelAndView mv = new ModelAndView("singleCustomerReportPage");
    	mv.addObject("customer",customer);
    	return mv;
    }
    @GetMapping("/customerUpdate/{id}")
    public ModelAndView showCustomerUpdatePage(@PathVariable String id) {
    	String role=carUserService.getRole();
    	String page="";
    	if(role.equalsIgnoreCase("Admin"))
    		page="customerUpdatePage1";
    	else if(role.equalsIgnoreCase("Customer"))
    		page="customerUpdatePage2";
    	Customer customer=customerDao.findById(id);
    	ModelAndView mv = new ModelAndView(page);
    	mv.addObject("customerRecord",customer);
    	return mv;
    }
    @PostMapping("/customerUpdate")
    public ModelAndView updateCustomer(@ModelAttribute("customerRecord") Customer customer) {
    	String role=carUserService.getRole();
    	String page="";
    	if(role.equalsIgnoreCase("Admin"))
    		page="redirect:/customerReport";
    	else if (role.equalsIgnoreCase("Customer"))
    		page="redirect:/singleCustomerReport";
    	customerDao.save(customer);
    	return new ModelAndView(page);
    }
    @GetMapping("/customerDelete/{id}")
    public ModelAndView deleteCustomer(@PathVariable String id) {
    	customerDao.deleteCustomerById(id);
    	repository.deleteById(id);
    	return new ModelAndView("redirect:/customerReport");
    }
    
    @ExceptionHandler(CustomerStatusException.class)
    public ModelAndView handleCustomerStatusException(CustomerStatusException exception) {
        // Custom error message
        String message = "Sorry Dear Customer, you need to complete your last booking and payment procedures.";

        // Prepare the ModelAndView object
        ModelAndView mv = new ModelAndView("carBookingErrorPage");
        mv.addObject("errorMessage", message);

        return mv;
    }

    @ExceptionHandler(CustomerLicenceException.class)
    public ModelAndView handleCustomerLicenceException(CustomerLicenceException exception) {
        // Custom error message
        String message = "Sorry Dear Customer, you need to renew your licence.";

        // Prepare the ModelAndView object
        ModelAndView mv = new ModelAndView("carBookingErrorPage");
        mv.addObject("errorMessage", message);

        return mv;
    }

    @GetMapping("/newBooking/{carNumber}")
    public ModelAndView showNewBookingPage(@PathVariable String carNumber) {
        CarBooking carBooking = new CarBooking();
        carBooking.setBookingId(carBookingDao.generateBookingId());
        carBooking.setCarNumber(carNumber);
        Double rentRate = carDao.findById(carNumber).getRentRate();
        carBooking.setUsername(carUserService.getUserName());

        ModelAndView mv = new ModelAndView("carBookingPage");
        mv.addObject("carBooking", carBooking);
        mv.addObject("rentRate", rentRate);
        return mv;
    }
    @PostMapping("/createBooking")
    public ModelAndView createBookingAndRedirectToPaymentPage(@ModelAttribute("carBooking") CarBooking carBooking) {
        System.out.println(carBooking.getBookingId());
        System.out.println(carBooking.getCarNumber());
        Double rentRate = carDao.findById(carBooking.getCarNumber()).getRentRate();
        long days = calculateDaysBetween(carBooking.getFromDate(), carBooking.getToDate());
        carBooking.setTotalPayment(rentRate * days);
        carBooking.setStatus("P");
        carBooking.setAdvancePayment(0.0);
        carBooking.setPendingPayment(carBooking.getTotalPayment());
        Customer customer = customerDao.findById(carUserService.getUserName());
        carBooking.setLicense(customer.getLicense());
        carBooking.setVariantId(carDao.findById(carBooking.getCarNumber()).getVariantId());
        carBookingDao.save(carBooking);
        return new ModelAndView("redirect:/makePayment/" + carBooking.getBookingId());
    }
    @GetMapping("/bookingReport")
    public ModelAndView showBookingReport() {
        String username = carUserService.getUserName();
        String role = carUserService.getRole();
        String page = role.equalsIgnoreCase("ADMIN")
                ? "carBookingReport1" : "carBookingReport2";
        ModelAndView mv = new ModelAndView(page);

        if (role.equalsIgnoreCase("ADMIN")) {
            List<CarBooking> allBookings = carBookingDao.findAll();
            mv.addObject("bookings", allBookings);
        } else {
            List<CarBooking> userBookings = carBookingDao.findAllByUsername(username);
            mv.addObject("bookings", userBookings);
        }
        return mv;
    }
    @GetMapping("/bookingReport/{bookingId}")
    public ModelAndView showBookingDetails(@PathVariable String bookingId) {
        String role = carUserService.getRole();
        CarBooking carBooking = carBookingDao.findById(bookingId);
        String page = role.equalsIgnoreCase("ADMIN")
                ? "carBookingDetails1" : "carBookingDetails2";
        ModelAndView mv = new ModelAndView(page);
        CarVariant variant = carVariantDao.findById(carBooking.getVariantId());
        Car car = carDao.findById(carBooking.getCarNumber());
        List<Transaction> transactions = transactionDao.findAllByBookingId(bookingId);
        mv.addObject("booking", carBooking);
        mv.addObject("variant", variant);
        mv.addObject("car", car);
        mv.addObject("transactions", transactions);
        return mv;
    }


    private long calculateDaysBetween(String fromDate, String toDate) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate start = LocalDate.parse(fromDate, formatter);
        LocalDate end = LocalDate.parse(toDate, formatter);
        return ChronoUnit.DAYS.between(start, end);
    }
    @GetMapping("/makePayment/{bookingId}")
    public ModelAndView showPaymentPage(@PathVariable String bookingId) {
        Transaction transaction = new Transaction();
        CarBooking carBooking = carBookingDao.findById(bookingId);
        Double totalPayment = carBooking.getTotalPayment();
        Double pendingPayment = carBooking.getPendingPayment();

        transaction.setTransactionId(transactionDao.generateTransactionId());
        transaction.setBookingId(bookingId);

        ModelAndView mv = new ModelAndView("paymentPage");
        mv.addObject("transaction", transaction);
        mv.addObject("totalPayment", totalPayment);
        mv.addObject("pendingPayment", pendingPayment);
        return mv;
    }

    @PostMapping("/makePayment")
    public ModelAndView makePayment(@ModelAttribute("transaction") Transaction transaction) {
        transaction.setApproved(null);
        transactionRepository.save(transaction);
        return new ModelAndView("redirect:/bookingReport/" + transaction.getBookingId());
    }

    @GetMapping("/updatePaymentStatus/{txnId}/{status}")
    public ModelAndView updatePaymentStatus(@PathVariable String txnId, @PathVariable String status) {
        Transaction transaction = transactionDao.findById(txnId);
        transaction.setApproved(status.equalsIgnoreCase("approve"));
        transactionRepository.save(transaction);

        if(status.equalsIgnoreCase("approve")) {
            CarBooking carBooking = carBookingDao.findById(transaction.getBookingId());
            carBooking.setPendingPayment(carBooking.getPendingPayment() - transaction.getAmount());
            if(carBooking.getAdvancePayment() == 0.0) {
                carBooking.setAdvancePayment(transaction.getAmount());
                // Update car status
            }

            carBooking.setStatus("CNF");
            carBookingDao.save(carBooking);
        }

        return new ModelAndView("redirect:/bookingPayments");
    }

    @GetMapping("/bookingPayments")
    public ModelAndView showBookingPayments() {
        ModelAndView mv = new ModelAndView("carBookingPayments");
        List<Transaction> transactions = transactionRepository.findAll();
        mv.addObject("transactions", transactions);
        return mv;
    }

    @GetMapping("/returnBooking/{bookingId}")
    public ModelAndView bookingReturn(@PathVariable String bookingId) {
        CarBooking carBooking = carBookingDao.findById(bookingId);
        carBooking.setStatus("R");
        carBookingDao.save(carBooking);

        return new ModelAndView("redirect:/bookingReport/" + bookingId);
    }

    @GetMapping("/cancelBooking/{bookingId}")
    public ModelAndView bookingCancel(@PathVariable String bookingId) {
        CarBooking carBooking = carBookingDao.findById(bookingId);
        carBooking.setStatus("C");
        carBookingDao.save(carBooking);

        return new ModelAndView("redirect:/bookingReport/" + bookingId);
    }
}