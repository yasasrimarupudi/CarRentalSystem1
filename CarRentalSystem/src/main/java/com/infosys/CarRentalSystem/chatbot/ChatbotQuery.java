package com.infosys.CarRentalSystem.chatbot;

public class ChatbotQuery {
    private String message;

    public ChatbotQuery() {}

    public ChatbotQuery(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
