import 'temp.dart';
import 'package:http/http.dart' as http;

Future<List<Temp>> fetchTemp() async {
  var  url = "http://192.168.1.14/stage/list_temp.php";
  var response = await http.get(url);
  var message= tempFromJson(response.body);
  print(message);
  return message;
}
