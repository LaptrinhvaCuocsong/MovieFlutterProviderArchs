import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';
import 'package:provider/provider.dart';

class MoviesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TopViewModel topViewModel = Provider.of<TopViewModel>(context);
    return BaseView<MoviesViewModel>(
      onViewModelReady: (viewModel) {
        viewModel.getMovies();
      },
      builder: (context, viewModel, child) {
        return Scaffold(
            appBar: AppBarCommonWidget(
              leadingWidgets: [
                AppBarImageActionButton(
                    imageNamed: Images.icMenu,
                    color: Colors.white,
                    onTapped: () {
                      topViewModel.showDrawer(ProfileView());
                    })
              ],
              centerWidgets: [
                AppBarTitle(title: Strings.moviesTitle, color: Colors.white)
              ],
              trailingWidgets: [
                AppBarImageActionButton(
                    imageNamed: viewModel.isDisplayByList
                        ? Images.icGrid
                        : Images.icList,
                    color: Colors.white,
                    onTapped: () {
                      viewModel.setDisplayByList(!viewModel.isDisplayByList);
                    })
              ],
            ),
            body: viewModel.state == ViewState.busy
                ? CircleProgressWidget(
                    strokeColor: AppColor.primaryColor,
                  )
                : _buildGridView(context, viewModel));
      },
    );
  }

  Widget _buildGridView(BuildContext context, MoviesViewModel viewModel) {
    if (viewModel.isDisplayByList) {
      return ListView.builder(
          itemCount: viewModel.movies.length,
          itemBuilder: (context, index) {
                return MovieListItemView(
            movie: viewModel.movies[index],
                onTap: () {
            },
      );
    });
  } else {
  return GridView.builder(
  itemCount: viewModel.movies.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 8,
              childAspectRatio: 0.8),
          itemBuilder: (context, index) {
            Movie movie = viewModel.movies[index];
            return MovieCollectionItemView(movie: movie);
          });
    }
  }
}
