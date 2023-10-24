import 'package:flutter/material.dart';
import 'package:hogme_flutter_application/utils/widgets/text_widgets.dart';

import '../../backend_connection/models/announcement_model.dart';

class AnnouncementData extends StatefulWidget {
  const AnnouncementData({
    super.key,
    required this.announcements,
  });
  final AnnouncementModel announcements;

  @override
  State<AnnouncementData> createState() => _AnnouncementDataState();
}

class _AnnouncementDataState extends State<AnnouncementData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.0,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text24Bold(text: widget.announcements.title!),
          text16Normal(text: widget.announcements.content!),
        ],
      ),
    );
  }
}
