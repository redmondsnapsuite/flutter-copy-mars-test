import 'dart:core';
import 'package:my_project/Api.dart';
import 'package:my_project/models/ListItem.dart';

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
