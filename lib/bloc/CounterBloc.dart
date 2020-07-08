import 'dart:async';
import 'dart:convert';
import './BlocProvider.dart';
import './models/models.dart';

class CounterBloc extends BlocBase{
  
  StreamController streamController = StreamController<UserInfo>.broadcast();
  
  Sink get infoManagerSink => streamController.sink;
  Stream<UserInfo> get counterStream => streamController.stream;
  
  UserInfo _info = UserInfo(currentWeight_: 0);

  UpdateUserInfo(String _json){
    _info = _info.concat(jsonDecode(_json));
    infoManagerSink.add(_info);
  }
/*
  incrementCounter(){
    String _json = '{"counter":'+((counter.currentWeight+1).toString())+'}';
    counter = counter.concat(jsonDecode(_json));
    counterSink.add(counter);
  }
*/
  @override
  void dispose() {
    streamController.close();
  }
}