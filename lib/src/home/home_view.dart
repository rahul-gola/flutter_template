import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_widget/modular_state.dart';
import 'package:flutter_clean_architecture/src/home/bloc/home_bloc.dart';

class HomeView extends BaseView<HomeBloc> {
  const HomeView(super.bloc, {super.key});

  @override
  Widget build(BuildContext context, HomeBloc bloc) {
    return Column(
      children: [
        BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return Expanded(
              child: ListView.builder(
                itemCount: state.list.length,
                itemBuilder: (context, index) {
                  return Text(state.list[index].title);
                },
              ),
            );
          },
        ),
      ],
    );
  }
}
