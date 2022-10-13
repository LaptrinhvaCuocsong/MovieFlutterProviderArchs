import 'dart:math';
import 'dart:ui';
import 'package:flutter_movie_provider_archs/core/core.dart';

enum MovieImageSizeType { backdrop, logo, poster, profile, still }

class MovieNwImageUtil {
  static final instance = MovieNwImageUtil._internal();

  MovieNwImageUtil._internal();

  List<String> getFileSizes(
      MovieImageConfig? imageConfiguration, MovieImageSizeType sizeType) {
    switch (sizeType) {
      case MovieImageSizeType.backdrop:
        return imageConfiguration?.images?.backdropSizes ?? [];
      case MovieImageSizeType.logo:
        return imageConfiguration?.images?.logoSizes ?? [];
      case MovieImageSizeType.poster:
        return imageConfiguration?.images?.posterSizes ?? [];
      case MovieImageSizeType.profile:
        return imageConfiguration?.images?.profileSizes ?? [];
      case MovieImageSizeType.still:
        return imageConfiguration?.images?.stillSizes ?? [];
    }
  }

  String movieUrlImage(MovieImageConfig? imageConfiguration, Size? imageSize,
      MovieImageSizeType sizeType, String path) {
    String secureBaseUrl = imageConfiguration?.images?.secureBaseUrl ?? '';
    if (secureBaseUrl.isEmpty) {
      return path;
    }
    String fileSize = 'original';
    try {
      if (imageSize != null) {
        int sMax = max(imageSize!.width, imageSize!.height).toInt();
        List<String> fileSizes = getFileSizes(imageConfiguration, sizeType);
        if (fileSizes.isNotEmpty) {
          List<int> fileSizeNumbers = fileSizes.map((e) {
            List<String> matches = e.getSubStrings(r'(\d+)$');
            if (matches.isEmpty) {
              return -1;
            }
            return int.tryParse(matches.last) ?? -1;
          }).toList();
          int index = fileSizeNumbers.indexWhere((element) => element >= sMax);
          if (index >= 0) {
            fileSize = fileSizes[index];
          }
        }
      }
    } catch (e) {
      print(e.toString());
    }
    return secureBaseUrl + fileSize + '/' + path;
  }
}
