import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/base/base_event.dart';
import 'package:flutter_clean_architecture/core/base/base_state.dart';

class BaseViewModel<E extends BaseEvent, S extends BaseState> extends Bloc<E, S> {
  BaseViewModel(super.initialState) {
    init();
  }

  void init() {}

  Future<void> apiCall<T>(
    BaseUseCase createCall, {
    required Params params,
    required void Function(T) onSuccess,
    void Function(NetworkError)? onFailure,
  }) async {
    await createCall.execute(params).then((value) {
      value.fold((error) {
        onFailure?.call(error as NetworkError);
      }, (data) {
        onSuccess(data as T);
      });
    });
  }
}

