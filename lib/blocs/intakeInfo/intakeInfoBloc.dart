import 'dart:async';
import 'dart:convert';
import './BlocProvider.dart';
import './states.dart';

class IntakeInfoBloc extends BlocBase{
  
  StreamController streamController = StreamController<IntakeInfo>.broadcast();
  
  Sink get infoManagerSink => streamController.sink;
  Stream<IntakeInfo> get intakeInfoStream => streamController.stream;
  
  IntakeInfo _info = IntakeInfo();

  UpdateIntakeInfo(String _json){
    _info = _info.concat(jsonDecode(_json));
    infoManagerSink.add(_info);
  }
  
  @override
  void dispose() {
    streamController.close();
  }
}