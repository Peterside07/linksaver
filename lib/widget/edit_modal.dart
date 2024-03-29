import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:linksaver/controller/link_controller.dart';
import 'package:linksaver/model/link.dart';
import 'package:linksaver/widget/textfield.dart';

void showEditDialog(BuildContext context, int index, Link link) {
  TextEditingController facebookController =
      TextEditingController(text: link.facebook);
  TextEditingController instagramController =
      TextEditingController(text: link.instagram);
  TextEditingController tiktokController =
      TextEditingController(text: link.tiktok);
  TextEditingController customLinkController =
      TextEditingController(text: link.customLink);

  final LinkController linkController = Get.put(LinkController());
  final formKey = GlobalKey<FormState>();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Form(
            key: formKey,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.7,
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Edit Link',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextFieldWithIcon(
                    labelText: 'Facebook',
                    iconData: FontAwesomeIcons.facebook,
                    controller: facebookController,
                    validator: (value) {
                      if (value!.isNotEmpty &&
                          !value.startsWith('facebook.com/')) {
                        return 'Enter a valid Facebook link (eg. facebook.com/url)';
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
                    controller: instagramController,
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
                    controller: tiktokController,
                    validator: (value) {
                      if (value!.isNotEmpty &&
                          !value.startsWith('tiktok.com/')) {
                        return 'Enter a valid Titok link (eg. tiktok.com/url)';
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
                      labelText: 'Other',
                      iconData: FontAwesomeIcons.link,
                      controller: customLinkController),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          linkController.editLink(
                            index,
                            facebook: facebookController.text,
                            instagram: instagramController.text,
                            tiktok: tiktokController.text,
                            customLink: customLinkController.text,
                          );

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
    },
  );
}
