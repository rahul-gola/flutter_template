import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/state/base_state.dart';

abstract class CubitBase<S extends BaseState> extends Cubit<S> {
  CubitBase(super.state) {
    init();
  }

  void init() {}
}
