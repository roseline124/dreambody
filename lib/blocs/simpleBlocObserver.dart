import 'package:bloc/bloc.dart';

// https://github.com/felangel/bloc/blob/1dabbecf9dedc2c7b4f3b12aa120b23db8a3451a/docs/migration.md#blocdelegate-renamed-to-blocobserver
class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
  }
}
