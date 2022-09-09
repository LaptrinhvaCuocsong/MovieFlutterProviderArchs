import 'nw_core.dart';

enum MovieUrlRequest { popularMovies }

class MovieUrlRequestBuilder implements UrlRequestConvertible {
  MovieUrlRequest request;

  MovieUrlRequestBuilder({required this.request});

  @override
  APIMethod apiMethod() {
    // TODO: implement apiMethod
    throw UnimplementedError();
  }

  @override
  String baseUrl() {
    // TODO: implement baseUrl
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic> body() {
    // TODO: implement body
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? headers() {
    // TODO: implement headers
    throw UnimplementedError();
  }

  @override
  Map<String, dynamic>? parameters() {
    // TODO: implement parameters
    throw UnimplementedError();
  }

  @override
  String path() {
    // TODO: implement path
    throw UnimplementedError();
  }
}
