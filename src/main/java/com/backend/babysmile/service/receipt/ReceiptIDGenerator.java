package com.backend.babysmile.service.receipt;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

import java.io.Serializable;

public class ReceiptIDGenerator implements IdentifierGenerator {
    @Override
    public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
        String prefix = "GR"; //static prefix
        String query = "SELECT MAX(r.receiptId) FROM Receipt r";
        String maxIdWithPrefix = session.createQuery(query, String.class).uniqueResult();
        Integer maxId = (maxIdWithPrefix != null) ? Integer.parseInt(maxIdWithPrefix.replace(prefix, "")) : null;
        int sequence = (maxId != null) ? maxId + 1 : 1;
        return prefix + String.format("%04d", sequence);
    }
}
