import 'package:flutter/material.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardComponents/Drawer/DrawerComponents/drawer_item_modal.dart';

class DrawerHelper {
  List<DrawerItemModal> itemList = [
    DrawerItemModal(title: 'Profile', icon: Icons.person_outline_rounded),
    DrawerItemModal(title: 'Apply For Leave', icon: Icons.message_outlined),
    DrawerItemModal(title: 'My Leaves', icon: Icons.message_outlined),
    DrawerItemModal(title: 'Join Metting', icon: Icons.video_chat_outlined),
    DrawerItemModal(title: 'Stop Tracking', icon: Icons.track_changes_outlined),
    DrawerItemModal(title: 'Logout', icon: Icons.login_outlined),
  ];

  List<DrawerItemModal> get items {
    return itemList;
  }
}
