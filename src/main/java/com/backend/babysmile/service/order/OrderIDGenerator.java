package com.backend.babysmile.service.order;

import java.io.Serializable;
import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class OrderIDGenerator implements IdentifierGenerator {
    @Override
    public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
        String prefix = "OD"; //static prefix
        String query = "SELECT MAX(o.id) FROM Order o";
        String maxIdWithPrefix = session.createQuery(query, String.class).uniqueResult();
        Integer maxId = (maxIdWithPrefix != null) ? Integer.parseInt(maxIdWithPrefix.replace(prefix, "")) : null;
        int sequence = (maxId != null) ? maxId + 1 : 1;
        return prefix + String.format("%04d", sequence);
    }
}

