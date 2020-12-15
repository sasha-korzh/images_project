import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:images_project/core/error/exception.dart';
import 'package:images_project/core/network/dio_settings.dart';
import 'package:images_project/core/util/app_config.dart';
import 'package:images_project/features/image_pages/data/mapper/image_entity_mapper.dart';
import 'package:images_project/features/image_pages/domain/entities/image_page.dart';
import 'package:meta/meta.dart';

abstract class RemoteImagePageDataSource {
  Future<ImagePage> getImagePage(int page);
}

class RemoteImagePageDataSourceImpl implements RemoteImagePageDataSource {
  final Dio client;
  final ImageEntityMapper imageEntityMapper;
  final DioSettings dioSettings;

  RemoteImagePageDataSourceImpl({
    @required this.client,
    @required this.imageEntityMapper,
    @required this.dioSettings,
  }) {
    client.interceptors.add(dioSettings.dioCacheManager.interceptor);
  }

  @override
  Future<ImagePage> getImagePage(int page) async {
    final urlImagePage = 'https://api.unsplash.com/photos?page=$page';
    final cacheOptions = await dioSettings.cacheOptions;

    final response = await client.get(
      urlImagePage,
      options: cacheOptions
    );


    if (response.statusCode == 200) {
      print(response.data);
      final resultList =
          imageEntityMapper.listFromJson(response.data);
      return ImagePage(currentPage: page, imageList: resultList);
    } else {
      throw ServerException();
    }
  }
}
