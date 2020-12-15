

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:images_project/core/error/exception.dart';
import 'package:images_project/core/error/failure.dart';
import 'package:images_project/features/image_pages/data/datasources/remote_image_page_data_source.dart';
import 'package:images_project/features/image_pages/data/repositories/image_page_repository.dart';
import 'package:images_project/features/image_pages/domain/entities/image_entity.dart';
import 'package:images_project/features/image_pages/domain/entities/image_page.dart';
import 'package:mockito/mockito.dart';

class MockRemoteImagePageDataSource extends Mock
  implements RemoteImagePageDataSource {}


void main() {
  MockRemoteImagePageDataSource mockRemoteDataSource;
  ImagePageRepositoryImpl imagePageRepository;

  setUp(() {
    mockRemoteDataSource = MockRemoteImagePageDataSource();
    imagePageRepository = ImagePageRepositoryImpl(
      dataSource: mockRemoteDataSource
    );
  });

  final List<ImageEntity> tImageList = [
    ImageEntity(id: '1', url: 'url1'),
    ImageEntity(id: '2', url: 'url2'),
    ImageEntity(id: '3', url: 'url3'),
    ImageEntity(id: '4', url: 'url4'),
  ];

  final ImagePage tImagePage = ImagePage(
    currentPage: 1,
    imageList: tImageList,
  );

  test(
    'should return data when call to [RemoteImagePageDataSource] is successfull',
    () async {
      // assert
      when(mockRemoteDataSource.getImagePage(any))
        .thenAnswer((_) async => tImagePage);
      // act
      final result = await imagePageRepository.getImagePage(1);
      // assert
      expect(result, Right(tImagePage));
      verify(mockRemoteDataSource.getImagePage(any));  
    }
  );

  test(
    'should return [Failure] when call to [RemoteImagePageDataSource] is unsuccessfull',
    () async {
      // assert
      when(mockRemoteDataSource.getImagePage(any))
        .thenThrow(ServerException());
      // act
      final result = await imagePageRepository.getImagePage(1);
      // assert
      expect(result, Left(ServerFailure()));
      verify(mockRemoteDataSource.getImagePage(any));  
    }
  );
  
}