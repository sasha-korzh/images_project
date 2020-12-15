part of 'get_image_page_bloc.dart';

abstract class GetImagePageEvent extends Equatable {
  const GetImagePageEvent();

  @override
  List<Object> get props => [];
}

class LoadMore extends GetImagePageEvent {}

