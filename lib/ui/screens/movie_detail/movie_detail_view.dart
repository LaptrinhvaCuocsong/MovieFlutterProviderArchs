import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';
import 'package:provider/provider.dart';

class MovieDetailView extends StatelessWidget {
  final Movie movie;

  MovieDetailView({required this.movie});

  @override
  Widget build(BuildContext context) {
    return BaseView<MovieDetailViewModel>(
      onViewModelReady: (viewModel) {},
      builder: (context, viewModel, child) {
        return Scaffold(
          appBar: AppBarCommonWidget(
            leadingWidgets: [
              AppBarImageActionButton(
                  imageNamed: Images.icBack,
                  color: Colors.white,
                  onTapped: () {
                    Navigator.of(context).pop();
                  })
            ],
            centerWidgets: [
              AppBarTitle(title: movie.title ?? '', color: Colors.white)
            ],
            trailingWidgets: [],
          ),
          body: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [_buildHeader(), _buildPosterAndOverview(context)],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      margin: EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40,
            child: Center(
              child: InkWell(
                child: Image(
                  image: AssetImage(Images.icStarSmallBlue),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTileWidget("Release date:",
                  movie.getReleaseDateFormatted("yyyy-MM-dd") ?? ""),
              SizedBox(
                height: 6,
              ),
              _buildTileWidget("Rating", movie.getRatingFormatted() ?? "")
            ],
          ))
        ],
      ),
    );
  }

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
          style: TextStyles.getStyle(
              12, FontFamilies.roboto, FontWeights.regular,
              color: AppColor.primaryColor),
        )
      ],
    );
  }

  Widget _buildPosterAndOverview(BuildContext context) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(left: 16, top: 16, right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPoster(context),
          SizedBox(
            width: 12,
          ),
          Expanded(child: _buildOverview())
        ],
      ),
    );
  }

  Widget _buildPoster(BuildContext context) {
    MovieImageConfig? imageConfig =
        Provider.of<DataShared>(context).movieImageConfig;
    String posterUrl = MovieNwImageUtil.instance.movieUrlImage(imageConfig,
        Size(120, 120), MovieImageSizeType.poster, movie.posterPath ?? "");
    return Container(
      width: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            child: (posterUrl.isEmpty || imageConfig == null)
                ? Container(
                    color: AppColor.lightGrayColor,
                  )
                : CachedNetworkImage(
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircleProgressWidget(
                          stroke: 6,
                          size: 30,
                          strokeColor: AppColor.primaryColor,
                        ),
                    imageUrl: posterUrl),
          ),
          Spacer(),
          Center(
            child: Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: AppColor.primaryColor),
              child: InkWell(
                child: Center(
                  child: Text("REMINDER",
                      style: TextStyles.getStyle(
                          12, FontFamilies.roboto, FontWeights.medium,
                          color: Colors.white)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverview() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Overview",
            style: TextStyles.getStyle(
                14, FontFamilies.roboto, FontWeights.medium,
                color: AppColor.primaryColor),
          ),
          SizedBox(
            height: 6,
          ),
          Expanded(
              child: Container(color: Colors.red, child: Text(
                """Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.""",
                textWidthBasis: TextWidthBasis.parent,
                maxLines: 20,
                style: TextStyles.getStyle(
                    12, FontFamilies.roboto, FontWeights.regular, overflow: TextOverflow.ellipsis),
              ),))
        ],
      ),
    );
  }
}
