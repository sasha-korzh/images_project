import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:images_project/core/util/app_config.dart';
import 'package:meta/meta.dart';

class DioSettings {
  final dioCacheManager = DioCacheManager(CacheConfig());
  final AppConfig appConfig;
  


  Future<Options> get cacheOptions async {
    return buildCacheOptions(
      Duration(days: 1),
      options: Options(
        headers: {
          'authorization' : await appConfig.getApiKey(),
          'content-type': 'application/json; charset=utf-8'
        }
      ),
    );
  }

  DioSettings({
    @required this.appConfig,
  });
}
