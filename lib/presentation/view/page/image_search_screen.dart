import 'package:flutter/material.dart';
import 'package:why_two_screen/presentation/view/widget/search_bar_widget.dart';
import 'package:why_two_screen/presentation/view_model/image_search_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class ImageSearchScreen extends StatefulWidget {
  const ImageSearchScreen({super.key});

  @override
  State<ImageSearchScreen> createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ImageSearchScreenViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'Explore',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(children: [
          const SearchBarWidget(),
          const SizedBox(height: 28),
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Expanded(
                  child: GridView.builder(
                    itemCount: state.items.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => Image.network(
                        state.items[index].previewURL,
                        fit: BoxFit.cover),
                  ),
                ),
        ]),
      ),
    );
  }
}
