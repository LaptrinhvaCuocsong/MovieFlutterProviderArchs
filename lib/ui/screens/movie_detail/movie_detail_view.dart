import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';

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
            child: Center(child: Text(""),),
          ),
        );
      },
    );
  }
}
