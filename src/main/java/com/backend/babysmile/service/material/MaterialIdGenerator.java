package com.backend.babysmile.service.material;

import com.backend.babysmile.model.entities.Material;
import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

import java.io.Serializable;

import static com.backend.babysmile.utils.CharTable.buildStringIDPrefix;

public class MaterialIdGenerator implements IdentifierGenerator {

    @Override
    public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
        Material material = (Material) object;
        String prefix = "MX";
        if (material.getMaterialName() != null && material.getMaterialName().length() >= 2) {
            prefix = buildStringIDPrefix(material.getMaterialName());
        }
        String query = String.format("SELECT MAX(material_id) FROM materials WHERE material_id LIKE '%s%%'", prefix);
        String maxIdWithPrefix = session.createNativeQuery(query, String.class).uniqueResult();
        int sequence = 1; // Start with 1 if no previous ID exists
        if (maxIdWithPrefix != null && maxIdWithPrefix.length() > prefix.length()) {
            String sequenceNum = maxIdWithPrefix.substring(prefix.length());
            sequence = Integer.parseInt(sequenceNum) + 1; // Increment existing max ID
        }

        return prefix + String.format("%04d", sequence);
    }
}

