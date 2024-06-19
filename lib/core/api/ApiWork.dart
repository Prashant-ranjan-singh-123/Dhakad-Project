import 'dart:convert';
import 'package:http/http.dart' as http;
import 'base_url.dart';


class DhakadApi {
  static Future<List> fetchData() async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse(ExternalUrl.base_url));

      if (response.statusCode == 200) {
        var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
        return decodedResponse['data'];
      } else {
        print('Failed to fetch data: ${response.statusCode}');
        return [];
      }
    } catch (e) {
      print('Exception during data fetching: $e');
      return [];
    } finally {
      client.close();
    }
  }
}
