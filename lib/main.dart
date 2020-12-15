import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:images_project/features/image_pages/presentation/bloc/get_image_page_bloc.dart';
import 'features/image_pages/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: BlocProvider<GetImagePageBloc>(
        create: (_) => di.sl.get<GetImagePageBloc>()..add(LoadMore()),
        child: HomePage(),
      ),
    );
  }
}
