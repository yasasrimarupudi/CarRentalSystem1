package com.infosys.CarRentalSystem.chatbot;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.Map;

@Service
public class ChatbotService {
    private final Map<String, String> responses;

    public ChatbotService() {
        responses = new HashMap<>();
        initializeResponses();
    }

    private void initializeResponses() {
        responses.put("rental", "To rent a car, please browse our available vehicles and select one that meets your needs. " +
                "You'll need a valid driver's license and credit card for the rental process.");
        responses.put("pricing", "Our rental prices start from $30 per day. The final price depends on the car model " +
                "and rental duration. Insurance options are available at additional cost.");
        responses.put("requirements", "To rent a car, you need: \n1. Valid driver's license\n2. Credit card\n" +
                "3. Must be 21 years or older\n4. Valid ID/Passport");
        responses.put("location", "Our rental locations can be found in major cities. Please check our locations page " +
                "for the nearest branch to you.");
        responses.put("help", "I can help you with:\n- Rental process\n- Pricing information\n- Requirements\n" +
                "- Location details\nJust ask your question!");
    }

    public String processQuery(String query) {
        query = query.toLowerCase().trim();
        
        if (query.contains("price") || query.contains("cost") || query.contains("rate")) {
            return responses.get("pricing");
        } else if (query.contains("rent") || query.contains("book")) {
            return responses.get("rental");
        } else if (query.contains("require") || query.contains("need")) {
            return responses.get("requirements");
        } else if (query.contains("location") || query.contains("branch") || query.contains("where")) {
            return responses.get("location");
        } else if (query.contains("help")) {
            return responses.get("help");
        }
        
        return "I'm sorry, I don't understand your question. Type 'help' to see what I can assist you with.";
}

}