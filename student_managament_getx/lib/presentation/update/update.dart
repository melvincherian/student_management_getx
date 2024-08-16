import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_managament_getx/cores/constant.dart';
import 'package:student_managament_getx/databasee/db_functions.dart';
import 'package:student_managament_getx/model/model.dart';
import 'package:student_managament_getx/presentation/home/home.dart';
import 'package:student_managament_getx/widget/textform_field.dart';

class ScreenUpdate extends StatefulWidget {
  const ScreenUpdate({super.key, required this.student});

  final StudentModel student;

  @override
  State<ScreenUpdate> createState() => _ScreenUpdateState();
}

class _ScreenUpdateState extends State<ScreenUpdate> {
  late TextEditingController nameController;
  late TextEditingController ageController;
  late TextEditingController placeController;
  late TextEditingController courseController;
  late TextEditingController imageController;
  late TextEditingController phoneController;

  bool photoRequiredError = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    nameController = TextEditingController(text: widget.student.name);
    ageController = TextEditingController(text: widget.student.age.toString());
    placeController = TextEditingController(text: widget.student.place);
    courseController = TextEditingController(text: widget.student.course);
    imageController = TextEditingController(text: widget.student.image);
    phoneController =
        TextEditingController(text: widget.student.phone.toString());

    RxString pickedImage = RxString(widget.student.image);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Update student',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Obx(() => InkWell(
                          onTap: () async {
                            final imagepath = await studentController
                                .pickImage(ImageSource.gallery);
                            pickedImage.value = imagepath ?? '';
                          },
                          child: CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 70,
                            backgroundImage: pickedImage.isEmpty
                                ? const NetworkImage(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShyZWYPEncWdEfHARCCc_DcvFFf1f1qcAgxQ&s')
                                : FileImage(File(pickedImage.value)),
                          ),
                        )),
                  ),
                  if (photoRequiredError)
                    const Text(
                      'Photo is required',
                      style: TextStyle(color: Colors.red),
                    ),
                  constantheight20,
                  CustomTextFormfield(
                      controller: nameController,
                      labelText: 'Name',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Name is required';
                        }
                        if (RegExp(r'\d').hasMatch(value)) {
                          return 'Numbers are not allowed';
                        }
                        if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                          return 'Special characters are not allowed';
                        }
                        return null;
                      }),
                  constantheigtht10,
                  CustomTextFormfield(
                      controller: ageController,
                      labelText: 'Age',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Age is required';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Only numbers are allowed';
                        }
                        if (value.length >= 3 || value.length <= 1) {
                          return 'Enter valid age';
                        }
                        return null;
                      }),
                  constantheigtht10,
                  CustomTextFormfield(
                      controller: placeController,
                      labelText: 'Place',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Place is required';
                        }
                        if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                          return 'Special characters are not allowed';
                        }
                        return null;
                      }),
                  constantheigtht10,
                  CustomTextFormfield(
                      controller: courseController,
                      labelText: 'Course',
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Course is required';
                        }
                        if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
                          return 'Special characters are not allowed';
                        }
                        return null;
                      }),
                  constantheigtht10,
                  CustomTextFormfield(
                      controller: phoneController,
                      labelText: 'Phone',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phonenumber is required';
                        }
                        if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                          return 'Only numbers are allowed';
                        }
                        if (value.length < 10 || value.length > 10) {
                          return 'Enter valid phone number';
                        }
                        return null;
                      }),
                  constantheigtht10,
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          if (pickedImage.isEmpty ||
                              pickedImage.value.isEmpty) {
                            photoRequiredError = true;
                          } else {
                            StudentModel updatestudent =
                                widget.student.copyWith(
                              name: nameController.text,
                              age: ageController.text,
                              place: placeController.text,
                              course: courseController.text,
                              image: pickedImage.string,
                              phone: int.parse(phoneController.text),
                            );
                            updateStudent(updatestudent);

                            Get.to(const Homepage());
                          }
                        }
                      },
                      child: const Text('Submit'))
                ],
              ),
            )),
      ),
    );
  }
}
