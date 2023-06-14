import 'dart:core';
import 'package:my_project/Api.dart';
import 'package:my_project/models/WorkOrderItem.dart';

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
