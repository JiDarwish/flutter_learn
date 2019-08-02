import 'package:rxdart/rxdart.dart';
import '../models/item_model.dart';
import '../resources/repository.dart';

class StoriesBloc {
  final _topIds = PublishSubject<List<int>>();
  final _repository = Repository();

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  _itemsTransformer() {
    return ScanStreamTransformer(
        (Map<int, Future<ItemModel>> acc, int id, _) {
          acc[id] = _repository.fetchItem(id);
          return acc;
        },
      <int, Future<ItemModel>>{}
    )
  }
  Observable get topIds => _topIds.stream;

  void dispose() {
    _topIds.close();
  }
}