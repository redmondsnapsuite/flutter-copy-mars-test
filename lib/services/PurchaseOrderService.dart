import 'dart:core';
import 'package:mars_test/Api.dart';
import 'package:mars_test/models/ListItem.dart';

class PurchaseOrderService {
  final Api api = new Api();

  Future<ListItem> List() async {
    try {
      var response = await api.fetchList<ListItem>();
      print(response);
      return response;
    } catch (e) {
      print(e);
      throw Exception('Failed to fetch data');
    }
  }
}
