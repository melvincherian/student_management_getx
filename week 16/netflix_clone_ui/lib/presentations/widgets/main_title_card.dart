import 'package:flutter/widgets.dart';
import 'package:netflix_clone_ui/cores/colors/constant_size.dart';
import 'package:netflix_clone_ui/presentations/search/widget/search_result.dart';
import 'package:netflix_clone_ui/presentations/widgets/main_title.dart';

class Maintitlecard extends StatelessWidget {
  const Maintitlecard({
    super.key,
    required this.title,
  });

  final String title;
   
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
               MainTitle(
                  title: title
                  ) ,
                  constantHeight,
                 LimitedBox(
                  maxHeight: 200,
                   child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: 
                      List.generate(10, (index)=>const MainCard())
                   
                   ),
                 )
          ],
        ),
      ],
    );
  }
}