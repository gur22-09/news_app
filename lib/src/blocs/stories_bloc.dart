import 'package:rxdart/rxdart.dart';
import '../models/item_models.dart';
import '../resourses/repository.dart';

class StoriesBloc{
  final _repository  = Repository();
  final _topIds = PublishSubject<List<int>>();

  fetchTopIds() async{
    final ids = await _repository.fetchTopIds();
    _topIds.sink.add(ids);
  }

  Observable<List<int>> get topIds => _topIds.stream;

  dispose(){
    _topIds.close();
  }
}