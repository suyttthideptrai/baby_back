package com.backend.babysmile.service.material;

import com.backend.babysmile.dto.respond.material.TypeData;
import com.backend.babysmile.model.entities.MaterialType;
import com.backend.babysmile.repository.material.MaterialTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class MaterialTypeService {

    @Autowired
    private MaterialTypeRepository materialTypeRepository;

    public List<TypeData> findAll() {

        return materialTypeRepository
                .findAll()
                .stream()
                .map(MaterialMapper::toTypesList)
                .collect(Collectors.toList());
    }

    public MaterialType addMaterialType(String typeName) {
        MaterialType materialType = MaterialType.builder()
                .typeName(typeName)
                .build();
        return materialTypeRepository.save(materialType);
    }

    public MaterialType findById(int typeId) {
        return materialTypeRepository.findById(typeId).orElse(null);
    }

    public void deleteMaterialType(int typeId) {
        materialTypeRepository.deleteById(typeId);
    }
}