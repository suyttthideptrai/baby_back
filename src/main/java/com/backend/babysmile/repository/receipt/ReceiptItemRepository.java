package com.backend.babysmile.repository.receipt;

import com.backend.babysmile.model.entities.ReceiptItem;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ReceiptItemRepository extends JpaRepository<ReceiptItem, Long> {

}
