package com.infosys.CarRentalSystem.chatbot;

public class ChatbotResponse {
    private String message;

    public ChatbotResponse() {}

    public ChatbotResponse(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}