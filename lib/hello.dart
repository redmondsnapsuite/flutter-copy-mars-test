

import 'package:mars_test/services/PurchaseOrderService.dart';
import 'package:mars_test/services/WorkOrderService.dart';

void main() async  {
  print('@@@START');

//Call PurchaseOrderService List
  PurchaseOrderService service = new PurchaseOrderService();

  dynamic results = new WorkOrderService().getWorkOrderDetails();

    print('@@@END');
}
