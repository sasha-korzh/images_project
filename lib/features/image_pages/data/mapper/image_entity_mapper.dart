
import 'package:images_project/features/image_pages/domain/entities/image_entity.dart';

class ImageEntityMapper {

  List<ImageEntity> listFromJson(List<dynamic> jsonList) {
    final List<ImageEntity> resultList = [];

    jsonList.forEach((element) {
      resultList.add(ImageEntity(
        id: element['id'],
        url: element['urls']['regular']
      ));
    });

    return resultList;
  }
}