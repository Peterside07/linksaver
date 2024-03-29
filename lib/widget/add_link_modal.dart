import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:linksaver/model/link.dart';
import 'package:linksaver/screen/link_tab_controlller.dart';
import 'package:linksaver/widget/textfield.dart';

import '../controller/link_controller.dart';

class AddLinkBottomSheet extends StatefulWidget {
  const AddLinkBottomSheet({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddLinkBottomSheetState createState() => _AddLinkBottomSheetState();
}

class _AddLinkBottomSheetState extends State<AddLinkBottomSheet> {
  final _formKey = GlobalKey<FormState>();
  final LinkController linkController = Get.put(LinkController());
  final LinkTabController tabController = Get.put(LinkTabController());

  String facebook = '';
  String instagram = '';
  String tiktok = '';
  String customLink = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20.0,
          right: 20.0,
          top: 20.0,
        ),
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0),
            topRight: Radius.circular(25.0),
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Add Link',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomTextFieldWithIcon(
                  labelText: 'Facebook',
                  iconData: FontAwesomeIcons.facebook,
                  onChanged: (value) {
                    facebook = value;
                  },
                  validator: (value) {
                    if (value!.isNotEmpty &&
                        !value.startsWith('facebook.com/')) {
                      return 'Enter a valid Facebook link(eg. facebook.com/url)';
                    } else if (value.length > 25) {
                      return 'Facebook link must be 25 characters or less';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFieldWithIcon(
                  labelText: 'Instagram',
                  iconData: FontAwesomeIcons.instagram,
                  onChanged: (value) {
                    instagram = value;
                  },
                  validator: (value) {
                    if (value!.isNotEmpty &&
                        !value.startsWith('instagram.com/')) {
                      return 'Enter a valid Instagram link (eg. instagram.com/url)';
                    } else if (value.length > 25) {
                      return 'Instagram link must be 25 characters or less';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFieldWithIcon(
                  labelText: 'TikTok',
                  iconData: FontAwesomeIcons.tiktok,
                  onChanged: (value) {
                    tiktok = value;
                  },
                  validator: (value) {
                    if (value!.isNotEmpty && !value.startsWith('tiktok.com/')) {
                      return 'Enter a valid TikTok link  (eg. tiktok.com/url)';
                    } else if (value.length > 25) {
                      return 'TikTok link must be 25 characters or less';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFieldWithIcon(
                  labelText: 'Other',
                  iconData: FontAwesomeIcons.link,
                  onChanged: (value) {
                    customLink = value;
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        linkController.addLink(
                          Link(
                            facebook: facebook,
                            instagram: instagram,
                            tiktok: tiktok,
                            customLink: customLink,
                          ),
                        );
                        tabController.controller.animateTo(1);
                        Navigator.pop(context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue), // Set button background color
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // Set button text color
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          const EdgeInsets.all(12)), // Set button padding
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              10), // Set button border radius
                        ),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(fontSize: 16), // Set button text style
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
