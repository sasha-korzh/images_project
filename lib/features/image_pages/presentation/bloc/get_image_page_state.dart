part of 'get_image_page_bloc.dart';

abstract class GetImagePageState extends Equatable {
  const GetImagePageState();
  
  @override
  List<Object> get props => [];
}

class GetImagePageInitial extends GetImagePageState {}

class Loading extends GetImagePageState {}

class EndPage extends GetImagePageState {}

class ErrorState extends GetImagePageState {
  final String message;

  ErrorState(this.message);

  @override
  List<Object> get props => [message];
}

class Loaded extends GetImagePageState {
  final List<ImageEntity> imageEntityList;

  Loaded(this.imageEntityList);

  @override
  List<Object> get props => [imageEntityList];
}