import 'package:flutter/material.dart';
import 'package:post_api/post_api_controller.dart';
import 'package:get/get.dart';

class PostApiScreen extends StatelessWidget {
  final _controller = Get.put(PostApiController());

  PostApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Data to Backend'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller.usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _controller.emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            DropdownButtonFormField<String>(
              value: _controller.selectedGender.value,
              onChanged: (value) {
                _controller.selectedGender.value = value!;
              },
              items: ['Male', 'Female', 'Other']
                  .map((gender) => DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              decoration: const InputDecoration(labelText: 'Gender'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _controller.submitForm();
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
