import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/bloc/event/base_event.dart';
import 'package:flutter_clean_architecture/core/base/bloc/state/base_state.dart';

abstract class BlocBase<E extends BaseEvent, S extends BaseState> extends Bloc<E, S> {
  BlocBase(super.initialState) {
    mapEventToState();
    init();
  }

  @mustCallSuper
  @protected
  void mapEventToState();

  void init() {}

  Future<void> apiCall<T>(
    BaseUseCase createCall, {
    required Params params,
    required void Function(T) onSuccess,
    void Function(BaseError)? onFailure,
  }) async {
    await createCall.execute(params).then((value) {
      value.fold((error) {
        onFailure?.call(error);
      }, (data) {
        onSuccess(data as T);
      });
    });
  }
}
