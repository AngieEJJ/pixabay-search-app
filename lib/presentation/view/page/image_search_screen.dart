import 'package:flutter/material.dart';
import 'package:why_two_screen/presentation/view/page/detail_image_screen.dart';
import 'package:why_two_screen/presentation/view/widget/custom_bottom_navigation_bar.dart';
import 'package:why_two_screen/presentation/view/widget/search_bar_widget.dart';
import 'package:why_two_screen/presentation/view_model/image_search_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class ImageSearchScreen extends StatefulWidget {
  const ImageSearchScreen({super.key});

  @override
  State<ImageSearchScreen> createState() => _ImageSearchScreenState();
}

class _ImageSearchScreenState extends State<ImageSearchScreen> {
  bool isLiked = false;

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
                    itemBuilder: (context, index) => GestureDetector(
                      onDoubleTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailImageScreen(
                                itemImage: state.items[index].previewURL,
                                tag: 'imageTag_$index'),
                          ),
                        );
                      },
                      child: Hero(
                        tag: 'imageTag_$index',
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 250,
                              height: 250,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                    state.items[index].previewURL,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                splashRadius: 0.01,
                                onPressed: () {
                                  viewModel.checkList(state.items[index].id);
                                  // print('${viewModel.liked}');
                                },
                                icon: Icon(
                                  viewModel.liked.contains(state.items[index].id)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
        ]),
      ),
      bottomNavigationBar: const CustomBottomNavigationBar(),
    );
  }
}
