import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:images_project/features/image_pages/domain/entities/image_entity.dart';
import 'package:images_project/features/image_pages/domain/usecases/get_image_page.dart';
import 'package:meta/meta.dart';

part 'get_image_page_event.dart';
part 'get_image_page_state.dart';

class GetImagePageBloc extends Bloc<GetImagePageEvent, GetImagePageState> {
  int page = 1;
  bool isFetching = false;
  final GetImagePage getImagePage;

  GetImagePageBloc({@required this.getImagePage})
      : super(GetImagePageInitial());

  @override
  Stream<GetImagePageState> mapEventToState(
    GetImagePageEvent event,
  ) async* {
    if (event is LoadMore) {
      if (page == 10) {
        yield EndPage();
      } else {
        yield Loading();
        final failureOrImagePage = await getImagePage(page);

        yield failureOrImagePage.fold(
          (l) => ErrorState('Server error'),
          (r) => Loaded(r.imageList),
        );

        page++;
      }
    }
  }
}
