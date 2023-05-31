import 'dart:core';

import 'package:my_project/api.dart';

import '../models/ListItem.dart';
import '../models/ApiResponse.dart';

class PurchaseOrderService {
  final Api api = new Api();

  Future<ListItem> List() async {
    try {

     
      var response = await api.List<ListItem>();

    } catch (e) {
      print(e);
      throw Exception('Failed to fetch data');
    }


  }
}
