import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linksaver/widget/link_tabs.dart';


class LinkTabController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final List<Tab> linkTabs = [
    const Tab(text: 'Empty'),
    const Tab(text: 'Links'),
  ];

  late TabController controller;

  @override
  void onInit() {
    super.onInit();
    controller = TabController(vsync: this, length: linkTabs.length);
  }

  @override
  void onClose() {
    controller.dispose();
    super.onClose();
  }
}

class TabbedWidget extends StatelessWidget {
  const TabbedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LinkTabController tabController = Get.put(LinkTabController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Links'),
      ),
      body: Column(
        children: [
          TabBar(
            controller: tabController.controller,
            tabs: tabController.linkTabs,
          ),
          Expanded(
            child: TabBarView(controller: tabController.controller, children: [
              const Center(child: Text('Home tab')),
              LinkTab(),
            ]),
          ),
        ],
      ),
    );
  }
  
}

