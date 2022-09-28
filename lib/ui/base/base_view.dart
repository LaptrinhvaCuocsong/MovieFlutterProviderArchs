import 'package:flutter/material.dart';
import 'package:flutter_movie_provider_archs/ui/base/base_ui.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T viewModel, Widget? child)
      builder;
  final void Function(T) onViewModelReady;

  BaseView({required this.builder, required this.onViewModelReady});

  @override
  State<StatefulWidget> createState() {
    return _BaseViewState();
  }
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T viewModel = GetIt.instance.get<T>();

  @override
  void initState() {
    super.initState();
    widget.onViewModelReady(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel,
        child: Consumer<T>(
          builder: widget.builder,
        ));
  }
}
