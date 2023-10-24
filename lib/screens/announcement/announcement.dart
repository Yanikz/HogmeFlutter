import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hogme_flutter_application/screens/announcement/announcementdata.dart';

import '../../backend_connection/controller/announcement_controller.dart';
import '../../utils/widgets/text_widgets.dart';

class Announcement extends StatefulWidget {
  const Announcement({super.key});

  @override
  State<Announcement> createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  final AnnouncementController _announcementController =
      Get.put(AnnouncementController());
  final isLoading = false.obs;
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: text24Bold(text: 'Announcement'),
                ),
                Container(
                  width: 24.0,
                  height: 24.0,
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: const Icon(
                    Icons.arrow_outward_sharp,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Obx(() {
              return _announcementController.isLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          _announcementController.announcementList.value.length,
                      itemBuilder: (context, index) {
                        return AnnouncementData(
                          announcements: _announcementController
                              .announcementList.value[index],
                        );
                      },
                    );
            }),
          ],
        ),
      ),
    );
  }
}
