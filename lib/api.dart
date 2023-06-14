import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_project/models/ApiResponseItem.dart';
import 'package:my_project/models/WorkOrderItem.dart';
import '../../models/ListItem.dart';
import './models/ApiResponse.dart';

/*
CREATE
LIST
DETAIL
UPDATE
DELETE
MEDIA
UX

*/

class Api {
  final String baseUrl = 'https://saturn.snapsuite.io/api';

  final headers = {
    'x-functions-key':
        'riR4vyP8VWAfe4rl59e6mauU0sYaxN8V2O8yKv8fsWGZ3YuYdaFUkw=='
  };

  Future<T> fetchList<T>({String path = "/global/list"}) async {
    try {
      final fullUrl = '$baseUrl$path' +
          "?actionId=24&id=0&maximumRows=100&t=b604d9ec-2ccf-4dd2-92c5-9824fac11428&u=f17c2640-933b-4e01-aa0b-2fbe518f71f9&uid=1&userid=1&s=Jupiter&correlationId=c4de449d-398f-4e51-846e-9dde2c56dd8f";

      final response = await http.get(Uri.parse(fullUrl), headers: headers);

      // print(response.body);

      if (response.statusCode == 200) {
        final ApiResponse<T> convertedRes = ApiResponse<T>.fromJson(
          json.decode(response.body),
          (resourceJson) => ListItem.fromJson(resourceJson) as T,
        );

        // print(convertedRes.toString());
        // print('after to stirng');
        return convertedRes.resources[0];
      }
    } catch (e) {
      print(e);
      throw Exception('Api File, error $e');
    }

    return T as Future<T>;
  }

  Future<T> fetchDetails<T>({String path = "/projects/mobile"}) async {
    try {
      final fullUrl =
          '$baseUrl$path' + "?id=51116&t=05a6f552-6325-4937-a0f3-522075ae3e28";

      final response = await http.get(Uri.parse(fullUrl), headers: headers);

      print(response.statusCode == 200);

      if (response.statusCode == 200) {
        final parsedJson = jsonDecode(response.body);
        return parsedJson['resources'] as T;
      }
    } catch (e) {
      print(e);
      throw Exception('Api File, error $e');
    }
    return T as Future<T>;
  }
}
