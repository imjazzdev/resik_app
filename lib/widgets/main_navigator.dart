import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:resik/utils/var_global.dart';
import 'package:resik/views/bottom_nav/home.dart';
import 'package:resik/views/bottom_nav/notifikasi.dart';
import 'package:resik/views/bottom_nav/pesanan.dart';

import 'package:resik/views/bottom_nav/profile.dart';
import 'package:resik/widgets/watermark.dart';

import '../views/pindai.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: VarGlobal.selected_bottom_bar);

  // Bottom Navigation Bar Items
  List<PersistentTabConfig> _navBarItems() {
    return [
      PersistentTabConfig(
        screen: const HomeView(),
        item: ItemConfig(
          activeForegroundColor: Colors.teal,
          inactiveForegroundColor: Colors.grey.shade700,
          icon: const Icon(CupertinoIcons.home),
          title: "Beranda",
        ),
      ),
      PersistentTabConfig(
        screen: const PesananView(),
        item: ItemConfig(
          activeForegroundColor: Colors.teal,
          inactiveForegroundColor: Colors.grey.shade700,
          icon: const Icon(CupertinoIcons.cart),
          title: "Pesanan",
        ),
      ),
      PersistentTabConfig(
        screen: PindaiView(),
        item: ItemConfig(
          activeForegroundColor: Colors.teal,
          inactiveForegroundColor: Colors.white,
          activeColorSecondary: Colors.white,
          inactiveBackgroundColor: Colors.white,
          icon: const Icon(
            CupertinoIcons.camera,
            size: 30,
          ),
          title: "Pindai",
        ),
      ),
      PersistentTabConfig(
        screen: const NotifikasiView(),
        item: ItemConfig(
          activeForegroundColor: Colors.teal,
          inactiveForegroundColor: Colors.grey.shade700,
          icon: const Icon(Icons.notifications_none_rounded),
          title: "Notifikasi",
        ),
      ),
      PersistentTabConfig(
        screen: const ProfileView(),
        item: ItemConfig(
          activeForegroundColor: Colors.teal,
          inactiveForegroundColor: Colors.grey.shade700,
          icon: const Icon(CupertinoIcons.person),
          title: "Profile",
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WatermarkWrapper(
      child: Scaffold(
        body: PersistentTabView(
          // context,
          controller: _controller,
          // screens: _buildScreens(),
          margin: EdgeInsets.all(0),
          tabs: _navBarItems(),
          navBarHeight: 55,
          backgroundColor: Colors.white,
          // hideNavigationBarWhenKeyboardShows: true,
          popAllScreensOnTapOfSelectedTab: true,
          navBarBuilder: (navBarConfig) => Style15BottomNavBar(
            navBarConfig: navBarConfig,
            navBarDecoration: NavBarDecoration(
              color: Colors.grey.shade100,
            ),
          ),
          screenTransitionAnimation: const ScreenTransitionAnimation(
            // animateTabTransition: true,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200),
          ),
          // navBarStyle: NavBarStyle.style6, // Style matching your old code
        ),
      ),
    );
  }
}
