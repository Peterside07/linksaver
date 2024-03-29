  import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget buildListItem(String title, String value, String linkType,
      Function() onEdit, Function() onDelete) {
    IconData iconData;
    switch (linkType) {
      case 'Facebook':
        iconData = FontAwesomeIcons.facebook;
        break;
      case 'Instagram':
        iconData = FontAwesomeIcons.instagram;
        break;
      case 'TikTok':
        iconData = FontAwesomeIcons.tiktok;
        break;
      default:
        iconData = FontAwesomeIcons.link;
    }

    return Container(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 2,
        // margin: const EdgeInsets.symmetric(horizontal: 12),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.blueGrey[100],
            child: FaIcon(iconData, color: Colors.blueGrey[700]),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(value),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.edit,
                ),
                onPressed: onEdit,
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: onDelete,
              ),
            ],
          ),
        ),
      ),
    );
  }
