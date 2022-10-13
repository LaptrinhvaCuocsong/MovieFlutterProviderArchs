export 'data_shared.dart';
export 'colors.dart';
export 'text_styles.dart';
export 'result.dart';
export 'strings.dart';
export 'images.dart';
export 'constants.dart';
export 'dialog_content.dart';
export 'movie_nw_image_util.dart';
export 'date_formatter.dart';
export 'global_keys.dart';
export 'app_navigator.dart';

T? tryCast<T>(dynamic x) {
  try {
    return x as T;
  } catch (e) {
    print('CastError when trying to cast $x to $T!. Type x is ${x.runtimeType}');
    return null;
  }
}