import 'package:greenlight_web/src/core/core.dart';

class APIResponse<T> {
  final T? data;
  final Failure? error;

  const APIResponse({this.data, this.error});
}
