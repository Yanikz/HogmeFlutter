import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class RegisterController extends GetxController {
  final ImagePicker _facilityPicture = ImagePicker();
  final ImagePicker _validId = ImagePicker();

  List<XFile>? facilityImages = [];
  List<String>? facilityImagePath = [];
}
