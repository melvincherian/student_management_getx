import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 150,
       height: 250,
               
                  decoration: BoxDecoration(
                    borderRadius: constantRadius,
                    image:const DecorationImage(image: NetworkImage('https://media.themoviedb.org/t/p/w220_and_h330_face/7QMsOTMUswlwxJP0rTTZfmz2tX2.jpg'))),
    );
  }
}