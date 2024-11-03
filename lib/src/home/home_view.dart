import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_page.dart';
import 'package:flutter_clean_architecture/src/home/bloc/home_bloc.dart';

class HomeView extends BasePageViewWidget<HomeBloc> {
  const HomeView(super.bloc, {super.key});

  @override
  Widget build(BuildContext context, HomeBloc model) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.list.length,
          itemBuilder: (context, index) {
            return Text(state.list[index].title);
          },
        );
      },
    );
  }
}
