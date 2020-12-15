
import 'package:equatable/equatable.dart';
import 'package:images_project/features/image_pages/domain/entities/image_entity.dart';
import 'package:meta/meta.dart';

class ImagePage extends Equatable {
  final int currentPage;
  final List<ImageEntity> imageList;

  ImagePage({
    @required this.currentPage,
    @required this.imageList,
  });

  @override
  List<Object> get props => [currentPage, imageList];

}