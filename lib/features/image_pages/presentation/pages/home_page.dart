import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:images_project/features/image_pages/domain/entities/image_entity.dart';
import 'package:images_project/features/image_pages/presentation/bloc/get_image_page_bloc.dart';
import 'package:images_project/features/image_pages/presentation/widgets/image_widget.dart';

class HomePage extends StatelessWidget {
  List<ImageEntity> imageEntityList = [];

  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var parentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: parentHeight,
        child: BlocBuilder<GetImagePageBloc, GetImagePageState>(
          builder: (context, state) {
            if (state is GetImagePageInitial ||
                state is Loading && imageEntityList.isEmpty) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ErrorState) {
              return ErrorWidget(state.message);
            } else if (state is Loaded) {
              imageEntityList.addAll(state.imageEntityList);
              context.watch<GetImagePageBloc>().isFetching = false;
            }

            
            return Column(
              children: [
                Expanded(child: _getGridBody(context, parentHeight)),
                _getLoadingIndicatorByState(state, parentHeight),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _getGridBody(BuildContext context, double parentHeight) {
    return GridView.builder(
      controller: scrollController
        ..addListener(() {
          if (scrollController.position.maxScrollExtent ==
                  scrollController.offset &&
              !context.read<GetImagePageBloc>().isFetching) {
            context.read<GetImagePageBloc>()
              ..isFetching = true
              ..add(LoadMore());
          }
        }),
      itemBuilder: (context, index) {
        var isLastIndex = index == imageEntityList.length;

        if (!isLastIndex) {
          return ImageWidget(imageEntityList[index]);
        } else {
          return Container();
        }
      },
      itemCount: imageEntityList.length + 1,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, childAspectRatio: 2 / 3),
    );
  }

  Widget _getLoadingIndicatorByState(
      GetImagePageState state, double parentHeight) {
    if (state is Loading) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: parentHeight * 0.03),
        child: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Container();
    }
  }
}
