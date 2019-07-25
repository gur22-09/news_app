import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/item_models.dart';
import '../resourses/repository.dart';

class CommentsBloc {
  final _commentsFetcher = PublishSubject<int>();
  final _commentsOutput = BehaviorSubject<Map<int, Future<ItemModel>>>();
  Repository _repository = Repository();

  //Stream getter
  Observable<Map<int, Future<ItemModel>>> get itemWithComments => _commentsOutput.stream;


  //Sink getter
  Function(int) get fetchItemsWithComments => _commentsFetcher.sink.add;

  CommentsBloc(){
    _commentsFetcher.stream.transform(_commentsTransformer()).pipe(_commentsOutput);
  }

  _commentsTransformer(){
    return ScanStreamTransformer<int, Map<int, Future<ItemModel>>> (
        (cache, int id, index){
          print(index);
          cache[id] = _repository.fetchItem(id);
          cache[id].then((ItemModel item) {
            item.kids.forEach((kidId) => fetchItemsWithComments(kidId));
          });
          return cache;
        },
      <int, Future<ItemModel>>{}
    );
  }

  dispose(){
    _commentsFetcher.close();
    _commentsOutput.close();
  }
}