import 'package:flutter/material.dart';
import 'package:flutx/flutx.dart';

import '../views/lecture_timetable_screen.dart';

class NavItem {
  final String title;
  final IconData activeIconData, inactiveIconData;

  NavItem(this.title, this.activeIconData, this.inactiveIconData);
}

class FullAppController extends FxController {
  int currentIndex = 0;
  int pages = 4;
  late TabController tabController;

  final TickerProvider tickerProvider;

  late List<NavItem> navItems;

  FullAppController(this.tickerProvider) {
    tabController =
        TabController(length: pages, vsync: tickerProvider, initialIndex: 0);
    navItems = [
      NavItem('Accueil', Icons.home, Icons.home_outlined),
      NavItem('Explorer', Icons.book, Icons.book_outlined),
      NavItem('Chat', Icons.chat, Icons.chat_outlined),
      NavItem('Profil', Icons.person, Icons.person_outlined),
    ];
  }

  @override
  void initState() {
    super.initState();

    tabController.addListener(handleTabSelection);
    tabController.animation!.addListener(() {
      final aniValue = tabController.animation!.value;
      if (aniValue - currentIndex > 0.5) {
        currentIndex++;
        update();
      } else if (aniValue - currentIndex < -0.5) {
        currentIndex--;
        update();
      }
    });
  }

  void changePage(int index) {
    tabController.animateTo(index);
  }

  void goToSetting() {
    changePage(3);
  }

  void goToTimeTable() {
    Navigator.of(context, rootNavigator: true).push(
        MaterialPageRoute(builder: (context) => const LectureTimeTableScreen()));
  }

  handleTabSelection() {
    currentIndex = tabController.index;
    update();
  }

  @override
  String getTag() {
    return 'full_app_controller';
  }
}
