import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';
import 'package:provider/provider.dart';

class MovieCollectionItemView extends StatelessWidget {
  final Movie movie;

  MovieCollectionItemView({required this.movie});

  @override
  Widget build(BuildContext context) {
    MovieImageConfig? imageConfig =
        Provider.of<DataShared>(context).movieImageConfig;
    String thumbnail = movie.posterPath ?? '';
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: LayoutBuilder(
          builder: (context, constraint) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: constraint.maxWidth,
                  height: constraint.maxWidth,
                  child: (thumbnail.isEmpty || imageConfig == null)
                      ? Container(color: AppColor.lightGrayColor)
                      : CachedNetworkImage(
                    fit: BoxFit.cover,
                          placeholder: (context, url) => CircleProgressWidget(
                              size: 30,
                              stroke: 4,
                              strokeColor: AppColor.primaryColor),
                          imageUrl: MovieNwImageUtil.instance.movieUrlImage(
                              imageConfig,
                              Size(constraint.maxWidth, constraint.maxWidth),
                              MovieImageSizeType.poster,
                              thumbnail)),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  movie.title ?? '',
                  maxLines: 2,
                  style: TextStyles.getStyle(
                      14, FontFamilies.roboto, FontWeights.medium,
                      color: AppColor.lightGrayColor),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
