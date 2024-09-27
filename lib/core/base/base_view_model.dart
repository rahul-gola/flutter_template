import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_event.dart';
import 'package:flutter_clean_architecture/core/base/base_state.dart';

class BaseViewModel<T extends BaseEvent, S extends BaseState> extends Bloc<T, S> {
  BaseViewModel(super.initialState);
}