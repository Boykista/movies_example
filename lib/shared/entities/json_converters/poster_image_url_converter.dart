import 'package:freezed_annotation/freezed_annotation.dart';

class BackdropImageUrlConverter extends JsonConverter<String, String> {
  const BackdropImageUrlConverter();

  @override
  String fromJson(json) {
    const baseUrl = 'https://image.tmdb.org/t/p/original';
    final url = '$baseUrl$json';

    return url;
  }

  @override
  String toJson(String object) {
    return object;
  }
}
