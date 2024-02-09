import 'package:task/core/constant/app_strings.dart';
import 'package:task/core/local/storage.dart';

class TokenUtil {
  static String _token = '';

  static Future<void> loadTokenToMemory() async {
    _token = getValue(AppString.token).toString();
  }

  static String getTokenFromMemory() {
    return _token;
  }

  static Future<void> saveToken(String myToken) async {
    saveValue(AppString.token, myToken);
    await loadTokenToMemory();
  }

  static void clearToken() {
    removeValue(AppString.token);
    _token = '';
  }
}
