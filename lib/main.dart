import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:why_two_screen/data/di/image_di.dart';
import 'package:why_two_screen/presentation/view/page/image_search_screen.dart';
import 'package:why_two_screen/presentation/view_model/image_search_screen_viewmodel.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => getIt<ImageSearchScreenViewModel>(),
        child: const ImageSearchScreen(),
      ),
    );
  }
}
