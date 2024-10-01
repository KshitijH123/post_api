import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_api/post_api_repositery.dart';

class PostApiController extends GetxController {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  var selectedGender = 'Male'.obs;

  Future<void> submitForm() async {
    String username = usernameController.text;
    String email = emailController.text;
    String gender = selectedGender.value;

    if (username.isEmpty || email.isEmpty || gender.isEmpty) {
      Get.snackbar('Error', 'Please fill all fields',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
      return;
    }

    final result = await PostApiRepository.submitUserData(username, email, gender);
    if (result) {
      Get.snackbar('Success', 'Data submitted successfully',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green);
    } else {
      Get.snackbar('Error', 'Failed to submit data',
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
    }
  }

  @override
  void onClose() {
    usernameController.dispose();
    emailController.dispose();
    super.onClose();
  }
}
