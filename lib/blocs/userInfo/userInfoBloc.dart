import 'dart:async';
import 'dart:convert';
import './BlocProvider.dart';
import './states.dart';

class UserInfoBloc extends BlocBase{
  
  StreamController streamController = StreamController<UserInfo>.broadcast();
  
  Sink get infoManagerSink => streamController.sink;
  Stream<UserInfo> get userInfoStream => streamController.stream;
  
  UserInfo _info = UserInfo(currentWeight_: 0);

  UpdateUserInfo(String _json){
    _info = _info.concat(jsonDecode(_json));
    infoManagerSink.add(_info);
  }
  
  @override
  void dispose() {
    streamController.close();
  }
}