import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final String serverBaseUrl =
      (Platform.environment['DREAMBODY_SERVER_BASE_URL']?.isEmpty ?? true)
          ? 'http://localhost:8080'
          : Platform.environment['DREAMBODY_SERVER_BASE_URL'];

  final config = {
    'SERVER_BASE_URL': serverBaseUrl,
  };

  final filename = 'lib/.env.dart';
  File(filename).writeAsString('final environment = ${json.encode(config)};');
}
