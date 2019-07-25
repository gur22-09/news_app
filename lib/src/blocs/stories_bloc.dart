import 'package:rxdart/rxdart.dart';
import '../models/item_models.dart';
import '../resourses/repository.dart';

class StoriesBloc {
  final _repository = Repository();
  final _topIds = PublishSubject<List<int>>();
  final _itemOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();
  final _itemFetcher = PublishSubject<int>();

  // Getter streams
  Observable<List<int>> get topIds => _topIds.stream;

  Observable<Map<int, Future<ItemModel>>> get items => _itemOutput.stream;

  // getter sinks
  Function(int) get fetchItem => _itemFetcher.sink.add;

  StoriesBloc() {
    _itemFetcher.stream.transform(_itemsTransformer()).pipe(_itemOutput);
  }

  fetchTopIds() async {
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  _itemsTransformer() {
    return ScanStreamTransformer(
      (Map<int, Future<ItemModel>> cache, int id, index) {
        cache[id] = _repository.fetchItem(id);
        return cache;
      },
      <int, Future<ItemModel>>{},
    );
  }

  dispose() {
    _topIds.close();
    _itemOutput.close();
    _itemFetcher.close();
  }
}
