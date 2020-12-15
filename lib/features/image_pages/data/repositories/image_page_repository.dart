
import 'package:images_project/core/error/exception.dart';
import 'package:images_project/features/image_pages/data/datasources/remote_image_page_data_source.dart';
import 'package:images_project/features/image_pages/domain/entities/image_page.dart';
import 'package:images_project/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:images_project/features/image_pages/domain/repositories/image_page_repository.dart';
import 'package:meta/meta.dart';

class ImagePageRepositoryImpl implements ImagePageRepository {
  final RemoteImagePageDataSource dataSource;

  ImagePageRepositoryImpl({
    @required this.dataSource,
  });

  @override
  Future<Either<Failure, ImagePage>> getImagePage(int page) async {
    try {
      final result = await dataSource.getImagePage(page);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

} 