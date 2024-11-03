import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_architecture/core/base/base_event.dart';
import 'package:flutter_clean_architecture/core/base/base_state.dart';
import 'package:flutter_clean_architecture/core/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

part 'home_event.dart';

part 'home_state.dart';

@injectable
class HomeBloc extends BaseViewModel<HomeEvent, HomeState> {
  HomeBloc(this._getArticleUseCase) : super(HomeState()) {
    on<GetArticlesEvent>((event, emit) {
      emit(state.copyWith(list: event.list));
    });
  }

  @override
  void init() {
    super.init();
    apiCall<List<ArticleModel>>(
      _getArticleUseCase,
      params: GetArticleParams(category: ''),
      onSuccess: (data) => add(GetArticlesEvent(data)),
    );
  }

  final GetArticleUseCase _getArticleUseCase;
}
