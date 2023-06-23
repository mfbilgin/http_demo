
import 'package:http/http.dart' as http;

class CategoryApi{
  static const String apiUrl = 'http://192.168.1.9:4213/categories';

  static Future getCategories() async{
    var url = Uri.parse(apiUrl);
    var response = await http.get(url);
    return response;
  }
}
