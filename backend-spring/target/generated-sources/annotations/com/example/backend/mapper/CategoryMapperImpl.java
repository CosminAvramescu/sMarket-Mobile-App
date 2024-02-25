package com.example.backend.mapper;

import com.example.backend.dto.CategoryDTO;
import com.example.backend.model.Category;
import java.util.ArrayList;
import java.util.List;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2024-02-25T19:10:26+0200",
    comments = "version: 1.5.3.Final, compiler: javac, environment: Java 17 (Oracle Corporation)"
)
@Component
public class CategoryMapperImpl implements CategoryMapper {

    @Override
    public CategoryDTO toCategoryDTO(Category category) {
        if ( category == null ) {
            return null;
        }

        CategoryDTO categoryDTO = new CategoryDTO();

        categoryDTO.setImageLink( category.getImageLink() );
        categoryDTO.setName( category.getName() );

        return categoryDTO;
    }

    @Override
    public List<CategoryDTO> toListCategoryDTO(List<Category> category) {
        if ( category == null ) {
            return null;
        }

        List<CategoryDTO> list = new ArrayList<CategoryDTO>( category.size() );
        for ( Category category1 : category ) {
            list.add( toCategoryDTO( category1 ) );
        }

        return list;
    }
}
