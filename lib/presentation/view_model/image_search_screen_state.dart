import '../../domain/model/photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_search_screen_state.freezed.dart';

part 'image_search_screen_state.g.dart';

@freezed
class ImageSearchScreenState with _$ImageSearchScreenState {
  factory ImageSearchScreenState(
    List<Photo> items,
    bool isLoading,
  ) = _ImageSearchScreenState;

  factory ImageSearchScreenState.fromJson(Map<String, dynamic> json) =>
      _$ImageSearchScreenStateFromJson(json);
}
