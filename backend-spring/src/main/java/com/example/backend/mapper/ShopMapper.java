package com.example.backend.mapper;
import com.example.backend.dto.ShopDTO;
import com.example.backend.model.Shop;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;

@Mapper(componentModel = "spring")
public interface ShopMapper {
    ShopDTO toShopDTO(Shop shop);
}

//
//@Mapper(componentModel = "spring")
//public interface GradeMapper {
//    @Mapping(target = "grade", source = "grade")
//    @Mapping(target = "quizId", source = "quiz.id")
//    @Mapping(target = "courseName", source = "quiz.course.courseName")
//    GradeDto toGradeDto(Grade quiz);
//
//    List<GradeDto> toListGradeDto(List<Grade> quizList);
//}