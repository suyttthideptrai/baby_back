package com.backend.babysmile.controller;

import com.backend.babysmile.dto.request.receipt.NewReceiptRequest;
import com.backend.babysmile.dto.respond.MessageRespond;
import com.backend.babysmile.dto.respond.receipt.ReceiptData;
import com.backend.babysmile.service.receipt.ReceiptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin(origins = "*")
@RestController
@RequestMapping("api/crud/receipt")
public class ReceiptController {

    @Autowired
    private ReceiptService receiptService;

    @PostMapping("/create")
    public ResponseEntity<MessageRespond> createReceipt(@RequestBody NewReceiptRequest request) {
        return receiptService.create(request);
    }

    @GetMapping("/all")
    public List<ReceiptData> getAllReceipts() {
        return receiptService.allReceipts();
    }

    @GetMapping("/details/{id}")
    public ReceiptData getAllReceipts(@PathVariable  String id) {
        return receiptService.getReceiptDetails(id);
    }

    @DeleteMapping("/delete")
    public ResponseEntity<MessageRespond> deleteReceipts(@RequestBody String[] receiptIds) {
        return receiptService.removeReceipt(receiptIds);
    }

     @GetMapping("/query/order/title/{query}")
     public List<ReceiptData> getReceiptsByOrderTitle(@PathVariable String query) {
         return receiptService.findReceiptsByOrderName(query);
     }
}