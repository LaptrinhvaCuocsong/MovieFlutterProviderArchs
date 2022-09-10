enum APIMethod { GET, POST, PUT, DELETE }

abstract class UrlRequestConvertible {
  String get baseUrl;
  APIMethod get method;
  String get path;
  Map<String, dynamic>? get headers;
  Map<String, dynamic>? get parameters;
  Map<String, dynamic>? get body;
}
