import 'package:data/src/source/article_data_source/article_ds.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ArticleDataSource)
class ArticleRepositoryImpl implements ArticleDataSource {
  @override
  Future<List<ArticleModel>> getArticles() {
    throw UnimplementedError();
  }
}
