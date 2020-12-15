

import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:images_project/features/image_pages/data/mapper/image_entity_mapper.dart';
import 'package:images_project/features/image_pages/domain/entities/image_entity.dart';

import '../../../../fixture/fixture_reader.dart';

void main() {
  ImageEntityMapper imageEntityMapper;

  setUp(() {
    imageEntityMapper = ImageEntityMapper();
  });

  final List<ImageEntity> tImageList = [
    ImageEntity(id: '1', url: 'url1'),
    ImageEntity(id: '2', url: 'url2'),
    ImageEntity(id: '3', url: 'url3'),
    ImageEntity(id: '4', url: 'url4'),
  ];

  test(
    'should return a valid [List<ImageEntity>] from json',
    () {
      // assert
      final jsonList = 
        json.decode(fixture('image_page_responce.json'));
      // act
      final result = imageEntityMapper.listFromJson(jsonList);
      //
      expect(result, tImageList);  
    }
  );
}