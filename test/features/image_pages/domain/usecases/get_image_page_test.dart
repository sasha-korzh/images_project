

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:images_project/features/image_pages/domain/entities/image_entity.dart';
import 'package:images_project/features/image_pages/domain/entities/image_page.dart';
import 'package:images_project/features/image_pages/domain/repositories/image_page_repository.dart';
import 'package:images_project/features/image_pages/domain/usecases/get_image_page.dart';
import 'package:mockito/mockito.dart';

class MockImagePageRepository extends Mock 
  implements ImagePageRepository {}

void main() {
  MockImagePageRepository mockImagePageRepository;
  GetImagePage usecase;

  setUp(() {
    mockImagePageRepository = MockImagePageRepository();
    usecase = GetImagePage(imagePageRepository: mockImagePageRepository);
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

  test('should get [ImagePage] from the repository', () async {
    // arrange
    when(mockImagePageRepository.getImagePage(any))
        .thenAnswer((_) async => Right(tImagePage));
    // act
    final result = await usecase(1);
    // assert
    expect(result, tImagePage);
    verify(mockImagePageRepository.getImagePage(any));
    verifyNoMoreInteractions(mockImagePageRepository);
  });

}