import 'package:my_project/services/WorkOrderService.dart';

import 'lib/models/ListItem.dart';
import 'lib/services/PurchaseOrderService.dart';

void main() async  {
  print('@@@START');

//Call PurchaseOrderService List
  PurchaseOrderService service = new PurchaseOrderService();

  dynamic results = new WorkOrderService().getWorkOrderDetails();

    print('@@@END');
}
