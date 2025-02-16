import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/base/base_widget/stateless/stateless_base.dart';
import 'package:flutter_clean_architecture/core/di/di.dart';
import 'package:flutter_clean_architecture/src/home/bloc/home_bloc.dart';
import 'package:flutter_clean_architecture/src/home/home_view.dart';

class HomeScreen extends StatelessBase<HomeBloc> {
  const HomeScreen({super.key});

  @override
  HomeBloc get bloc => getIt<HomeBloc>();

  @override
  Widget build(BuildContext context, HomeBloc bloc) {
    return HomeView(bloc);
  }

  @override
  PreferredSizeWidget? buildAppbar() {
    return AppBar();
  }
}
