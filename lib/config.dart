import 'package:dreambody/.env.dart';

final serverBaseUrl = environment['SERVER_BASE_URL'];
final loginUrl =
    '$serverBaseUrl/oauth2/authorize/google?redirect_uri=$serverBaseUrl/oauth2/redirect';
const K_Android_UserAgent =
    'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';
