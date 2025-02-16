import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_widget/base_page.dart';
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
