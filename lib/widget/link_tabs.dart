import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linksaver/controller/link_controller.dart';
import 'package:linksaver/widget/edit_modal.dart';
import 'package:linksaver/widget/list_item.dart';

class LinkTab extends StatelessWidget {
  final LinkController linkController = Get.put(LinkController());

  LinkTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => ListView.builder(
        itemCount: linkController.links.length,
        itemBuilder: (context, index) {
          final link = linkController.links[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (link.facebook.isNotEmpty)
                buildListItem('Facebook', link.facebook, 'Facebook', () {
                  showEditDialog(context, index, link);
                }, () {
                  linkController.removeFacebook(index);
                }),
              if (link.instagram.isNotEmpty)
                buildListItem('Instagram', link.instagram, 'Instagram', () {
                  showEditDialog(context, index, link);
                }, () {
                  linkController.removeInstagram(index);
                }),
              if (link.tiktok.isNotEmpty)
                buildListItem('TikTok', link.tiktok, 'TikTok', () {
                  showEditDialog(context, index, link);
                }, () {
                  linkController.removeTikTok(index);
                }),
              if (link.customLink.isNotEmpty)
                buildListItem('Custom Link', link.customLink, '', () {
                  showEditDialog(context, index, link);
                }, () {
                  linkController.removeCustomLink(index);
                }),
            ],
          );
        },
      ),
    ));
  }
}
