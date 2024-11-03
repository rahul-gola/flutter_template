import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_view_model.dart';
import 'package:flutter_clean_architecture/core/base/core_base_page_state.dart';

/// Every Page/View should be inherited from this
abstract class BasePage<VM extends BaseViewModel> extends StatefulWidget {
  const BasePage({super.key});
}

abstract class BasePageState<VM extends BaseViewModel, T extends BasePage<VM>>
    extends CoreBasePageState<VM, T> {
  @mustCallSuper
  @protected
  VM get provideBase;

  late final VM _viewModel = provideBase;
}

abstract class BaseStatefulPage<VM extends BaseViewModel,
    B extends BasePage<VM>> extends BasePageState<VM, B> {
  @override
  void initState() {
    super.initState();
    onBaseModelReady(_viewModel);
  }

  @override
  Widget build(BuildContext context) {
    return getLayout();
  }
}

abstract class BasePageViewWidget<T extends BaseViewModel> extends Widget {
  final T bloc;

  const BasePageViewWidget(this.bloc, {super.key});

  @protected
  Widget build(BuildContext context, T model);

  @override
  DataProviderElement<T> createElement() => DataProviderElement<T>(this, bloc);
}

class DataProviderElement<T extends BaseViewModel> extends ComponentElement {
  final T bloc;

  DataProviderElement(BasePageViewWidget super.widget, this.bloc);

  @override
  BasePageViewWidget get widget => super.widget as BasePageViewWidget;

  @override
  Widget build() {
    return BlocProvider<T>(
      create: (context) => bloc,
      child: widget.build(this, bloc),
    );
  }
}
