package com.infosys.CarRentalSystem.chatbot;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/chatbot")
public class ChatbotController {

    private final ChatbotService chatbotService;

    @Autowired
    public ChatbotController(ChatbotService chatbotService) {
        this.chatbotService = chatbotService;
    }

    @PostMapping("/query")
    public ResponseEntity<ChatbotResponse> handleQuery(@RequestBody ChatbotQuery query) {
        String userMessage = query.getMessage();
        String botResponseMessage = chatbotService.processQuery(userMessage);
        return ResponseEntity.ok(new ChatbotResponse(botResponseMessage));
    }

}
