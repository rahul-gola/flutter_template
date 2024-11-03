import 'package:data/src/network/retrofit_service.dart';
import 'package:data/src/source/article_data_source/article_ds.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ArticleDataSource)
class ArticleRepositoryImpl implements ArticleDataSource {
  ArticleRepositoryImpl(this._retrofitService);

  final RetrofitService _retrofitService;

  @override
  Future<List<ArticleModel>> getArticles() {
    return _retrofitService.getArticles();
  }
}
