import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';
import 'package:provider/provider.dart';

class MovieListItemView extends StatelessWidget {
  final Movie movie;
  final VoidCallback onTap;

  MovieListItemView({required this.movie, required this.onTap});

  Widget _buildTileWidget(String title, String value) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style:
              TextStyles.getStyle(12, FontFamilies.roboto, FontWeights.medium),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          value,
          style:
              TextStyles.getStyle(12, FontFamilies.roboto, FontWeights.regular),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    MovieImageConfig? imageConfig =
        Provider.of<DataShared>(context).movieImageConfig;
    Size posterSize = Size(120, 120);
    String thumbnail = MovieNwImageUtil.instance.movieUrlImage(imageConfig,
        posterSize, MovieImageSizeType.poster, movie.posterPath ?? '');
    return InkWell(
      onTap: () {
        this.onTap();
      },
      child: Container(
        margin: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
        padding: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: AppColor.lightGrayColor))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              movie.title ?? '',
              maxLines: 1,
              style: TextStyles.getStyle(
                  16, FontFamilies.roboto, FontWeights.medium,
                  overflow: TextOverflow.ellipsis),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: posterSize.width,
                  height: posterSize.height,
                  child: (thumbnail.isEmpty || imageConfig == null)
                      ? SizedBox()
                      : CachedNetworkImage(
                          placeholder: (context, url) => CircleProgressWidget(
                            strokeColor: AppColor.primaryColor,
                            size: 30,
                            stroke: 3,
                          ),
                          imageUrl: thumbnail,
                          fit: BoxFit.cover,
                        ),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildTileWidget(
                                    'Release date:',
                                    movie.getReleaseDateFormatted(
                                            "dd/MM/yyyy") ??
                                        ''),
                                SizedBox(
                                  height: 4,
                                ),
                                _buildTileWidget(
                                    'Rating', movie.getRatingFormatted() ?? '')
                              ],
                            ),
                            margin: const EdgeInsets.only(right: 46),
                          ),
                          Spacer(),
                          InkWell(
                            child: Container(
                              width: 30,
                              height: 30,
                              child: Image(
                                image: AssetImage(Images.icStarSmallBlue),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 6),
                      Text(
                        'Overview',
                        style: TextStyles.getStyle(
                            12, FontFamilies.roboto, FontWeights.medium,
                            color: AppColor.primaryColor),
                      ),
                      SizedBox(height: 6),
                      Text(
                        movie.overview ?? '',
                        maxLines: 4,
                        style: TextStyles.getStyle(
                            12, FontFamilies.roboto, FontWeights.regular,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ],
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
