import 'package:movies_example/services/api_service/api/movies_api.dart';

class ApiService {
  ApiService._();
  static final _instance = ApiService._();
  factory ApiService() {
    return _instance;
  }

  final MoviesApi moviesApi = MoviesApi();
}

final apiService = ApiService();
