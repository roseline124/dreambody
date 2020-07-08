import 'dart:async';
import 'dart:convert';
import './BlocProvider.dart';
import './models/models.dart';

class CounterBloc extends BlocBase{
  
  StreamController streamController = StreamController<UserInfo>.broadcast();
  
  Sink get counterSink => streamController.sink;
  Stream<UserInfo> get counterStream => streamController.stream;
  
  UserInfo counter = UserInfo(counter_: 0);

  incrementCounter(){
    //counter = UserInfo(counter_: counter.counter+2);
    String _json = '{"counter":'+((counter.counter+1).toString())+'}';
    counter = counter.concat(jsonDecode(_json));
    counterSink.add(counter);
  }

  @override
  void dispose() {
    streamController.close();
  }
  /*
  StreamController streamController = StreamController<UserInfo>.broadcast();
  
  Sink get counterSink => streamController.sink;
  Stream<UserInfo> get counterStream => streamController.stream;
  
  UserInfo counter = UserInfo.fromJson(jsonDecode(r'''{
      "id": "0",
      "currentWeight": 0.0,
      "dailyIntakeCalorie": 0,
      "dateOfBirth": "19990101",
      "goalWeight": 1,
      "height": 0,
      "gender": 0,
      "goal": 1,
      "activity": 0,
  }'''));

  incrementCounter(){
    counterSink.add(counter.concatJson(jsonDecode('{"goal": 3}')));
  }

  @override
  void dispose() {
    streamController.close();
  }
   */
}