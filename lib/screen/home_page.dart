// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linksaver/controller/link_controller.dart';
import 'package:linksaver/screen/link_tab_controlller.dart';
import 'package:linksaver/widget/add_link_modal.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final LinkController linkController = Get.put(LinkController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => const AddLinkBottomSheet(),
        ),
        child: const Icon(Icons.add),
      ),
      body: const Column(
        children: [
          Expanded(
            flex: 4,
            child: TabbedWidget(),
          )
        ],
      ),
    );
  }
}


