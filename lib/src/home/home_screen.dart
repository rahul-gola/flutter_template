import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/base_widget/stateful/base_stateful_widget.dart';
import 'package:flutter_clean_architecture/core/di/di.dart';
import 'package:flutter_clean_architecture/src/home/bloc/home_bloc.dart';
import 'package:flutter_clean_architecture/src/home/home_view.dart';

class HomeScreen extends BaseStatefulWidget<HomeBloc> {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends BasePageState<HomeBloc, HomeScreen> {
  @override
  HomeBloc get provideBase => getIt<HomeBloc>();

  @override
  Widget buildView(BuildContext context, HomeBloc model) {
    return HomeView(model);
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return AppBar();
  }
}

// class HomeScreen extends BasePage<HomeBloc> {
//   const HomeScreen({super.key});
//
//   @override
//   State<StatefulWidget> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends BaseStatefulPage<HomeBloc, HomeScreen> {
//   @override
//   HomeBloc get provideBase => getIt<HomeBloc>();
//
//   @override
//   Widget buildView(BuildContext context, HomeBloc model) {
//     return HomeView(model);
//   }
//
//   @override
//   PreferredSizeWidget? buildAppbar() {
//     return AppBar();
//   }
// }
