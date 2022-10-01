import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/core/core.dart';
import 'package:flutter_movie_provider_archs/ui/ui.dart';
import 'package:provider/provider.dart';

class MoviesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TopViewModel topViewModel = Provider.of<TopViewModel>(context);
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
          trailingWidgets: [],
        ),
        body: Center(
          child: Text('Movies'),
        ));
  }
}
