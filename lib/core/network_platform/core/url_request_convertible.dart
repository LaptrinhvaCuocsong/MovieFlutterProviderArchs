enum APIMethod { GET, POST, PUT, DELETE }

abstract class UrlRequestConvertible {
  String baseUrl();
  APIMethod apiMethod();
  String path();
  Map<String, dynamic>? headers();
  Map<String, dynamic>? parameters();
  Map<String, dynamic> body();
}
