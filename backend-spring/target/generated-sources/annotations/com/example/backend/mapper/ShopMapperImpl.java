package com.example.backend.mapper;

import com.example.backend.dto.ShopDTO;
import com.example.backend.model.Shop;
import javax.annotation.processing.Generated;
import org.springframework.stereotype.Component;

@Generated(
    value = "org.mapstruct.ap.MappingProcessor",
    date = "2024-02-25T19:10:26+0200",
    comments = "version: 1.5.3.Final, compiler: javac, environment: Java 17 (Oracle Corporation)"
)
@Component
public class ShopMapperImpl implements ShopMapper {

    @Override
    public ShopDTO toShopDTO(Shop shop) {
        if ( shop == null ) {
            return null;
        }

        ShopDTO shopDTO = new ShopDTO();

        shopDTO.setId( shop.getId() );
        shopDTO.setCity( shop.getCity() );

        return shopDTO;
    }
}
