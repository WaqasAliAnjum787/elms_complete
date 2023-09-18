import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/InfoSection/item_modal.dart';

class Helper {
  List<Item> getInfoItemsTitle() {
    return [
      Item(title: 'Group Details', imageSrc: 'assets/images/group_details.png'),
      Item(title: 'Fee Structure', imageSrc: 'assets/images/fee_structure.png'),
      Item(title: 'Workshop Time', imageSrc: 'assets/images/workshop_time.png'),
      Item(title: 'Casians', imageSrc: 'assets/images/casians.png'),
    ];
  }
}
