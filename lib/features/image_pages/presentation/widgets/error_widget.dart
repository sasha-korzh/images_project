import 'package:flutter/material.dart';
import 'package:images_project/features/image_pages/presentation/bloc/get_image_page_bloc.dart';
import 'package:images_project/injection_container.dart';

class ErrorWidget extends StatelessWidget {
  final String message;

  ErrorWidget(this.message);

  @override
  Widget build(BuildContext context) {
    var parentHeight = MediaQuery.of(context).size.height;

    return Container(
      child: Column(
        children: [
          Text(message),
          SizedBox(height: parentHeight * 0.1),
          IconButton(
            onPressed: () {
              sl.get<GetImagePageBloc>().add(LoadMore());
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
    );
  }
}