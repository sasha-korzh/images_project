
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class ImageEntity extends Equatable {
  final String id;
  final String url;

  ImageEntity({
    @required this.id,
    @required this.url,
  });

  @override
  List<Object> get props => [id, url];

}