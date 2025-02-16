import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_widget/core_base_page_state.dart';

/// A base StatefulWidget that works with a BLoC (Business Logic Component).
///
/// [ViewModel] represents the ViewModel/BLoC type that this widget will use.
abstract class BaseStatefulWidget<ViewModel extends BlocBase>
    extends StatefulWidget {
  /// Creates a [BaseStatefulWidget].
  ///
  /// The [key] parameter is optional and is passed to the parent [StatefulWidget].
  const BaseStatefulWidget({super.key});
}

/// A base state class that provides common functionality for pages using BLoCs.
///
/// [ViewModel] is the ViewModel/BLoC type.
/// [Widget] is the corresponding [BaseStatefulWidget] type.
abstract class BasePageState<ViewModel extends BlocBase,
        Widget extends BaseStatefulWidget<ViewModel>>
    extends CoreBasePageState<ViewModel, Widget> {
  /// Provides the base ViewModel/BLoC instance.
  ///
  /// This must be implemented by subclasses to provide the specific ViewModel/BLoC instance.
  /// The implementation must be annotated with [@mustCallSuper] and [@protected].
  @mustCallSuper
  @protected
  ViewModel get provideBase;

  /// The ViewModel/BLoC instance that will be used throughout the widget's lifecycle.
  late final ViewModel _viewModel = provideBase;
}

/// A concrete implementation of [BasePageState] that provides additional lifecycle handling.
///
/// [ViewModel] is the ViewModel/BLoC type.
/// [BaseWidget] is the corresponding [BaseStatefulWidget] type.
abstract class BaseState<ViewModel extends BlocBase,
        BaseWidget extends BaseStatefulWidget<ViewModel>>
    extends BasePageState<ViewModel, BaseWidget> {
  /// Initializes the state and calls [onBaseModelReady] with the ViewModel.
  ///
  /// This is called when the widget is first inserted into the widget tree.
  @override
  void initState() {
    super.initState();
    onBaseModelReady(_viewModel);
  }

  /// Builds the widget layout.
  ///
  /// Returns the widget tree by calling [getLayout()].
  @override
  Widget build(BuildContext context) {
    return getLayout();
  }
}
