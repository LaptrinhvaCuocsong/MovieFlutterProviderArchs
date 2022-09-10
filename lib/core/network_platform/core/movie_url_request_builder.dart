import 'nw_core.dart';

class MovieUrlRequestBuilder implements UrlRequestConvertible {
  late APIMethod _method;
  late String _path;
  Map<String, dynamic>? _body;
  Map<String, dynamic>? _parameters;
  Map<String, dynamic>? _headers;

  MovieUrlRequestBuilder(APIMethod method, String path,
      {Map<String, dynamic>? body,
      Map<String, dynamic>? parameters,
      Map<String, dynamic>? headers}) {
    this._method = method;
    this._path = path;
    this._body = body;
    this._parameters = parameters;
    this._headers = headers;
  }

  @override
  String get baseUrl => 'https://api.themoviedb.org';

  @override
  Map<String, dynamic>? get body => _body;

  @override
  Map<String, dynamic>? get headers {
    Map<String, dynamic> headers = {'Content-Type': 'application/json'};
    if (_headers != null) {
      _headers!.forEach((key, value) {
        headers[key] = value;
      });
    }
    return headers;
  }

  @override
  APIMethod get method => _method;

  @override
  Map<String, dynamic>? get parameters => _parameters;

  @override
  String get path => _path;
}
