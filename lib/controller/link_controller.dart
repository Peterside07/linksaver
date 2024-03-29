import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:linksaver/model/link.dart';

class LinkController extends GetxController {
  // RxList to store the links
  final RxList<Link> _links = <Link>[].obs;

  List<Link> get links => _links;

  @override
  void onInit() {
    super.onInit();
    loadLinks();
  }
  // Method to load Links
  void loadLinks() async {
    final linksBox = await Hive.openBox<Link>('links');
    _links.assignAll(linksBox.values.toList());
  }
  // Method to add a Link
  void addLink(Link link) async {
    final linksBox = await Hive.openBox<Link>('links');
    await linksBox.add(link);
    _links.add(link);
  }


// Method to edit a Link
  void editLink(int index, {String? facebook, String? instagram, String? tiktok, String? customLink}) async {
    final linksBox = await Hive.openBox<Link>('links');
    Link link = _links[index];
    if (facebook != null) link.facebook = facebook;
    if (instagram != null) link.instagram = instagram;
    if (tiktok != null) link.tiktok = tiktok;
    if (customLink != null) link.customLink = customLink;
    await linksBox.putAt(index, link);
    _links[index] = link;
  }

  // Method to remove Facebook property from a Link
  void removeFacebook(int index) async {
    final linksBox = await Hive.openBox<Link>('links');
    Link link = _links[index];
    link.facebook = '';
    await linksBox.putAt(index, link);
    _links[index] = link;
  }

  // Method to remove Instagram property from a Link
  void removeInstagram(int index) async {
    final linksBox = await Hive.openBox<Link>('links');
    Link link = _links[index];
    link.instagram = '';
    await linksBox.putAt(index, link);
    _links[index] = link;
  }

  // Method to remove TikTok property from a Link
  void removeTikTok(int index) async {
    final linksBox = await Hive.openBox<Link>('links');
    Link link = _links[index];
    link.tiktok = '';
    await linksBox.putAt(index, link);
    _links[index] = link;
  }

  // Method to remove Custom Link property from a Link
  void removeCustomLink(int index) async {
    final linksBox = await Hive.openBox<Link>('links');
    Link link = _links[index];
    link.customLink = '';
    await linksBox.putAt(index, link);
    _links[index] = link;
  }
}


