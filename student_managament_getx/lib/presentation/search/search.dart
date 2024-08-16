import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_managament_getx/controller/controller.dart';
import 'package:student_managament_getx/cores/colors.dart';
import 'package:student_managament_getx/cores/constant.dart';
import 'package:student_managament_getx/widget/show_dialog.dart';

final StudentController studentController = Get.put(StudentController());

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    studentController.fetchAllStudents();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Search students',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                studentController.search(value);
              },
              decoration: InputDecoration(
                  labelText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8))),
            ),
          ),
          Expanded(child: Obx(() {
            if (studentController.students.isEmpty) {
              return const Center(
                child: Text('No students found '),
              );
            } else {
              return ListView.separated(
                  separatorBuilder: (context, index) => constantheigtht10,
                  itemCount: studentController.filteredStudents.length,
                  itemBuilder: (context, index) {
                    var student = studentController.filteredStudents[index];
                    return GestureDetector(
                      onTap: () {
                        StudentDialogue.showStudentDialog(
                          context,
                          student,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: backgroundcolor,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(color: Colors.black, spreadRadius: 2)
                            ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: FileImage(File(student.image)),
                                        fit: BoxFit.cover)),
                              ),
                            ),
                            const SizedBox(
                              width: 36,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  student.name,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      color: whitecolor,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Course:${student.course}',
                                  style: const TextStyle(
                                      color: whitecolor, fontSize: 18),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  'Age:${student.age}',
                                  style: const TextStyle(
                                      color: whitecolor, fontSize: 18),
                                )
                              ],
                            ))
                          ],
                        ),
                      ),
                    );
                  });
            }
          }))
        ],
      ),
    );
  }
}