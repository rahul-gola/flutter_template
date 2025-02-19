import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Abstract class that extends [Widget] and provides a base structure for stateless widgets
/// that use a [Bloc] for state management.
///
/// The class ensures that each extending widget provides its own [Bloc] and a [build] method.
/// It also provides a default implementation for creating a [Scaffold] with an optional [AppBar].
///
/// [T] is a generic type that must extend [BlocBase].
abstract class StatelessBase<T extends BlocBase> extends Widget {
  /// Constructor for [StatelessBase].
  const StatelessBase({super.key});

  /// Must be overridden by subclasses to provide the [Bloc] instance.
  @mustCallSuper
  @protected
  T get bloc;

  /// Must be overridden by subclasses to build the widget's UI.
  ///
  /// [context] is the current [BuildContext].
  /// [bloc] is the [Bloc] instance provided by the subclass.
  @protected
  Widget build(BuildContext context, T bloc);

  /// Creates a [DataProviderElement] for this widget.
  @override
  DataProviderElement<T> createElement() => DataProviderElement<T>(this, bloc);

  /// Builds an [AppBar] for the screen.
  ///
  /// Subclasses can override this method to provide their own [AppBar].
  /// Returns `null` by default, indicating no [AppBar].
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  /// Disposes resources if needed.
  ///
  /// Subclasses can override this method to perform cleanup.
  void dispose() {}
}

/// Custom [ComponentElement] for [StatelessBase] widgets.
///
/// This element is responsible for providing the [Bloc] to its child widget and building the [Scaffold].
class DataProviderElement<T extends BlocBase> extends ComponentElement {
  /// Constructor for [DataProviderElement].
  ///
  /// [widget] is the [StatelessBase] widget that created this element.
  /// [_bloc] is the [Bloc] instance provided by the widget.
  DataProviderElement(StatelessBase super.widget, this._bloc);

  /// The [Bloc] instance provided by the [StatelessBase] widget.
  final T _bloc;

  /// Ensures that [widget] is of type [StatelessBase].
  @override
  late final StatelessBase widget = super.widget as StatelessBase;

  /// Builds the widget tree.
  ///
  /// Wraps the child widget with a [BlocProvider] to provide the [Bloc] to its subtree.
  /// Builds a [Scaffold] with an optional [AppBar] and the child widget's body.
  @override
  Widget build() {
    return BlocProvider<T>(
      create: (context) => _bloc,
      child: Scaffold(
        appBar: widget.buildAppbar(),
        body: widget.build(this, _bloc),
        resizeToAvoidBottomInset: true,
      ),
    );
  }

  /// Called when the element is deactivated.
  ///
  /// Calls the `dispose` method of the [StatelessBase] widget to perform cleanup.
  @override
  void deactivate() {
    super.deactivate();
    widget.dispose();
  }
}
