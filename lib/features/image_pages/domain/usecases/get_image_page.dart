
import 'package:dartz/dartz.dart';
import 'package:images_project/core/error/failure.dart';
import 'package:images_project/features/image_pages/domain/entities/image_page.dart';
import 'package:images_project/features/image_pages/domain/repositories/image_page_repository.dart';
import 'package:meta/meta.dart';

class GetImagePage {
  final ImagePageRepository imagePageRepository;

  GetImagePage({
    @required this.imagePageRepository,
  });

  Future<Either<Failure, ImagePage>> call(int page) async {
    return await imagePageRepository.getImagePage(page);
  }

}