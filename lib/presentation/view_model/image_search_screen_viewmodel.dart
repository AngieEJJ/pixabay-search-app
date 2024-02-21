import 'package:flutter/cupertino.dart';
import 'package:why_two_screen/domain/use_case/get_photos_use_case.dart';
import 'package:why_two_screen/presentation/view_model/image_search_screen_state.dart';
import '../../domain/model/photo.dart';

class ImageSearchScreenViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  ImageSearchScreenViewModel(this.getPhotosUseCase);

  ImageSearchScreenState _state = ImageSearchScreenState([], false);

  ImageSearchScreenState get state => _state;

  Future<void> loadIcon(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    final List<Photo> items = await getPhotosUseCase.execute(query);

    _state = state.copyWith(items: items);
    notifyListeners();

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }


  final liked = <int>{};

  void checkList(int id) {
    liked.contains(id)
        ? liked.remove(id)
        : liked.add(id);
    notifyListeners();
  }
}
