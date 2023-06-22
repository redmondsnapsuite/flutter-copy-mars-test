import 'dart:core';
import 'package:mars_test/Api.dart';
import 'package:mars_test/models/WorkOrderItem.dart';

class WorkOrderService {
  final Api api = new Api();

  Future<WorkOrderItem> getWorkOrderDetails() async {
    try {
      var response = await api.fetchDetails<WorkOrderItem>();
      print(response);
      return response;
    } catch (e) {
      print(e);
      throw Exception('Failed to fetch data' + e.toString());
    }
  }
}
