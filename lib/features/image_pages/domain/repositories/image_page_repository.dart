
import 'package:dartz/dartz.dart';
import 'package:images_project/core/error/failure.dart';
import 'package:images_project/features/image_pages/domain/entities/image_page.dart';

abstract class ImagePageRepository {
  Future<Either<Failure, ImagePage>> getImagePage(int page);
}