package com.example.backend.mapper;

import com.example.backend.dto.ProductDTO;
import com.example.backend.model.Product;
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
public class ProductMapperImpl implements ProductMapper {

    @Override
    public ProductDTO toProductDTO(Product product) {
        if ( product == null ) {
            return null;
        }

        ProductDTO productDTO = new ProductDTO();

        productDTO.setImageLink( product.getImageLink() );
        productDTO.setId( product.getId() );
        productDTO.setName( product.getName() );
        productDTO.setPrice( product.getPrice() );
        productDTO.setShelfType( product.getShelfType() );
        productDTO.setRow( product.getRow() );
        productDTO.setSection( product.getSection() );
        productDTO.setShelve( product.getShelve() );

        return productDTO;
    }

    @Override
    public List<ProductDTO> toListProductDTO(List<Product> product) {
        if ( product == null ) {
            return null;
        }

        List<ProductDTO> list = new ArrayList<ProductDTO>( product.size() );
        for ( Product product1 : product ) {
            list.add( toProductDTO( product1 ) );
        }

        return list;
    }
}
