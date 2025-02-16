import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseView<B extends BlocBase> extends Widget {
  const BaseView(this._bloc, {super.key});

  final B _bloc;

  @protected
  Widget build(BuildContext context, B bloc);

  @override
  ViewElement<B> createElement() => ViewElement<B>(this, _bloc);

  void dispose() {}
}

class ViewElement<B extends BlocBase> extends ComponentElement {
  ViewElement(BaseView super.widget, this._bloc);

  final B _bloc;

  @override
  late final BaseView widget = super.widget as BaseView;

  @override
  Widget build() {
    return BlocProvider<B>(
      create: (context) => _bloc,
      child: widget.build(this, _bloc),
    );
  }

  @override
  void deactivate() {
    super.deactivate();
    widget.dispose();
  }
}
