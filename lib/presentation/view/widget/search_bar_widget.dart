import 'package:flutter/material.dart';
import 'package:why_two_screen/presentation/view_model/image_search_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ImageSearchScreenViewModel>();
    return TextField(
      controller: _textController,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 2,
              color: Color(0xFF4FB6B2),
            ),
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(color: Colors.grey),
          suffixIcon: GestureDetector(
            onTap: () async {
              viewModel.loadIcon(_textController.text);
            },
            child: const Icon(
              Icons.search,
              color: Color(0xFF4FB6B2),
            ),
          )),
    );
  }
}
