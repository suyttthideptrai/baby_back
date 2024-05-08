package com.backend.babysmile.service.vendor;

import com.backend.babysmile.model.entities.Vendor;
import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

import java.io.Serializable;

import static com.backend.babysmile.utils.CharTable.buildStringIDPrefix;

public class VendorIdGenerator implements IdentifierGenerator {

    @Override
    public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
        Vendor vendor = (Vendor) object;
        String prefix = "VD";
        if (vendor.getVendorName() != null && vendor.getVendorName().length() >= 2) {
            prefix = buildStringIDPrefix(vendor.getVendorName());
        }
        String query = String.format("SELECT MAX(vendor_id) FROM vendors WHERE vendor_id LIKE '%s%%'", prefix);
        String maxIdWithPrefix = session.createNativeQuery(query, String.class).uniqueResult();
        int sequence = 1; // Start with 1 if no previous ID exists
        if (maxIdWithPrefix != null && maxIdWithPrefix.length() > prefix.length()) {
            String sequenceNum = maxIdWithPrefix.substring(prefix.length());
            sequence = Integer.parseInt(sequenceNum) + 1; // Increment existing max ID
        }
        return prefix + String.format("%04d", sequence);
    }
}