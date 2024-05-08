package com.backend.babysmile.repository.receipt;

import com.backend.babysmile.model.entities.Receipt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ReceiptRepository extends JpaRepository<Receipt, String> {

    @Query("SELECT r FROM Receipt r WHERE r.order.orderTitle LIKE %:query%")
    List<Receipt> findByOrderTitle(@Param("query") String query);
}
