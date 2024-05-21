package com.backend.babysmile.repository.receipt;

import com.backend.babysmile.model.entities.Receipt;
import com.backend.babysmile.model.enums.HiddenStatus;
import jakarta.transaction.Transactional;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Collection;
import java.util.List;
import java.util.Set;

public interface ReceiptRepository extends JpaRepository<Receipt, String> {

    @Query("SELECT r FROM Receipt r WHERE r.order.orderTitle LIKE %:query%")
    List<Receipt> findByOrderTitle(@Param("query") String query);

    @Transactional
    @Modifying
    @Query("UPDATE Receipt r SET r.hiddenStatus = 1 WHERE r.receiptId IN :receiptIdSet")
    void hideReceiptByIds(Set<String> receiptIdSet);

    List<Receipt> findAllByHiddenStatus(HiddenStatus hiddenStatus, Sort sort);
}
