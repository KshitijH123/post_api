import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:post_api/post_api_controller.dart';

class PostApiScreen extends StatelessWidget {
  final PostApiController _controller = Get.put(PostApiController());

  PostApiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Username Field
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _controller.usernameController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Username',
                  contentPadding: const EdgeInsets.all(16.0),
                ),
              ),
            ),

            // Email Field
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                controller: _controller.emailController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Email',
                  contentPadding: const EdgeInsets.all(16.0),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),

            // Gender Dropdown
            Container(
              margin: const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: DropdownButtonFormField<String>(
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
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: 'Gender',
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),

            // Submit Button
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
