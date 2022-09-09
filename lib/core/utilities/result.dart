class Result<Success, Failure> {
  late Success? data;
  late Failure? error;

  Result({this.data, this.error});

  bool get isSuccess => data != null && error == null;
}
