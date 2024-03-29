import 'package:hive/hive.dart';


part 'link.g.dart';

@HiveType(typeId: 0)
class Link extends HiveObject {
  //String value to store the link facebook
  @HiveField(0)
  late String facebook;

  //String value to store the link instagram
  @HiveField(1)
  late String instagram;

  //String value to store the link tiktok
  @HiveField(2)
  late String tiktok;

  //String value to store the link customLink
  @HiveField(3)
  late String customLink;

  Link({
    required this.facebook,
    required this.instagram,
    required this.tiktok,
    required this.customLink,
  });
}


