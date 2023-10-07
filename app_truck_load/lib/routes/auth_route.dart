import 'package:app_truck_load/utilities/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

Future<Response> auth({required String login, required String senha}) async {
  const urlMovimentacao = "auth/login";

  return await http.post(Uri.parse(Consts.url + urlMovimentacao),
      body: {"login": login, "password": senha});
}

Future<Response> logoutApp() async {
  const urlMovimentacao = "auth/logout";

  final prefs = await SharedPreferences.getInstance();
  var token = prefs.getString("CURRENT_USER_TOKEN");
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': "Bearer $token"
  };

  return await http.post(Uri.parse(Consts.url + urlMovimentacao),
      headers: requestHeaders);
}
