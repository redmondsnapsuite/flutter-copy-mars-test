import 'dart:convert';
import 'dart:html';
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

  final media_headers = {
      "Content-Type": "multipart/form_data",
          'x-functions-key':
        'riR4vyP8VWAfe4rl59e6mauU0sYaxN8V2O8yKv8fsWGZ3YuYdaFUkw=='
  }

  Future<T> fetchList<T>({String path = "/global/list"}) async {
    try {
      final fullUrl = '$baseUrl$path' +
          "?actionId=24&id=0&maximumRows=100&t=b604d9ec-2ccf-4dd2-92c5-9824fac11428&u=f17c2640-933b-4e01-aa0b-2fbe518f71f9&uid=1&userid=1&s=Jupiter&correlationId=c4de449d-398f-4e51-846e-9dde2c56dd8f";

      final response = await http.get(Uri.parse(fullUrl), headers: headers);

      // print(response.body);

      if (response.statusCode == 200) {
        // final ApiResponse<T> convertedRes = ApiResponse<T>.fromJson(
        //   json.decode(response.body),
        //   (resourceJson) => ListItem.fromJson(resourceJson) as T,
        // );

        // print(convertedRes.toString());
        // print('after to stirng');
        final parsedJson = jsonDecode(response.body);
        return parsedJson['resources'];
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
        return parsedJson['resources'];
      }
    } catch (e) {
      print(e);
      throw Exception('Api File, error $e');
    }
    return T as Future<T>;
  }

  Future<T> updateData<T>(
      {String path = "/projects/mobile",
      required Map<String, dynamic> body}) async {
    try {
      final fullUrl =
          '$baseUrl$path' + "?id=51116&t=05a6f552-6325-4937-a0f3-522075ae3e28";

      final response = await http.patch(
        Uri.parse('$fullUrl'),
        headers: headers,
        body: jsonEncode(body),
      );

      print(response.statusCode == 200);

      if (response.statusCode == 200) {
        final parsedJson = jsonDecode(response.body);
        return parsedJson['resources'];
      }
    } catch (e) {
      print(e);
      throw Exception('Api File, error $e');
    }
    return T as Future<T>;
  }

  Future<T> createData<T>(
      {String path = "/projects/mobile",
      required Map<String, dynamic> body}) async {
    try {
      final fullUrl =
          '$baseUrl$path' + "?id=51116&t=05a6f552-6325-4937-a0f3-522075ae3e28";

      final response = await http.post(
        Uri.parse('$fullUrl'),
        headers: headers,
        body: jsonEncode(body),
      );

      print(response.statusCode == 200);

      if (response.statusCode == 200) {
        final parsedJson = jsonDecode(response.body);
        return parsedJson['resources'];
      }
    } catch (e) {
      print(e);
      throw Exception('Api File, error $e');
    }
    return T as Future<T>;
  }

    Future<T> deleteData<T>(
      {String path = "/projects/mobile",
      required Map<String, dynamic> body}) async {
    try {
      final fullUrl =
          '$baseUrl$path' + "?id=51116&t=05a6f552-6325-4937-a0f3-522075ae3e28";

      final response = await http.delete(
        Uri.parse('$fullUrl'),
        headers: headers,
        body: jsonEncode(body),
      );

      print(response.statusCode == 200);

      if (response.statusCode == 200) {
        final parsedJson = jsonDecode(response.body);
        return parsedJson['resources'];
      }
    } catch (e) {
      print(e);
      throw Exception('Api File, error $e');
    }
    return T as Future<T>;
  }

  //MEDIA for testing
  Future<T> createMedia<T>(
      {String path = "/projects/mobile",
      required Map<String, dynamic> body}) async {
    try {
      final fullUrl =
          '$baseUrl$path' + "?id=51116&t=05a6f552-6325-4937-a0f3-522075ae3e28";

      // final response = await http.post(
      //   Uri.parse('$fullUrl'),
      //   headers: media_headers,
      //   body: body, //by default we use jsonencode but this is for formData
      // );

      final req = await http.MultipartRequest('POST', Uri.parse('$fullUrl'));

      req.headers.addAll(media_headers);

      body.forEach((key, value) {
        req.fields[key] = value.toString();
      });

      var response = await req.send();

      print(response.statusCode == 200);

      if (response.statusCode == 200) {
      final parsedJson = jsonDecode(await response.stream.bytesToString());
      return parsedJson['resources'];
      }
    } catch (e) {
      print(e);
      throw Exception('Api File, error $e');
    }
    return T as Future<T>;
  }


  //UX DATA/DROPDOWNS
  Future<T> fetchUX<T>({String path = "/projects/mobile"}) async {
    try {
      final fullUrl =
          '$baseUrl$path' + "?id=51116&t=05a6f552-6325-4937-a0f3-522075ae3e28";

      final response = await http.get(Uri.parse(fullUrl), headers: headers);

      print(response.statusCode == 200);

      if (response.statusCode == 200) {
        final parsedJson = jsonDecode(response.body);
        return parsedJson['resources'];
      }
    } catch (e) {
      print(e);
      throw Exception('Api File, error $e');
    }
    return T as Future<T>;
  }

  //END
}
