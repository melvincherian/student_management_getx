
import 'package:flutter/material.dart';
import 'package:netflix_clone_ui/cores/colors/colors.dart';


class VideoListItemWidget extends StatelessWidget {
  final int index;
  const VideoListItemWidget({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Container(
          color: Colors.blue,
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 10
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment:MainAxisAlignment.spaceBetween ,
              children: [

                // left side
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.black.withOpacity(0.5),
                  child: IconButton(onPressed: (){}, icon:const Icon(Icons.volume_off,
                  color: whiteColor,
                  size: 30,
                  )
                  )
                  ),

                  //right side
                  
                const  Column(
                  mainAxisAlignment:MainAxisAlignment.end ,
                    children: [
                      Padding(
                        
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CircleAvatar(
                          radius: 30,
                           backgroundImage: NetworkImage('https://media.themoviedb.org/t/p/w64_and_h64_face/A1pIXQZD86MzfP5pvr37C68YiGv.jpg'),
                        ),
                      ),
                      VideoActionWidget(icon: Icons.emoji_emotions, title: 'LOL'),
                
                      VideoActionWidget(icon: Icons.add, title: 'My List'),
                    
                       VideoActionWidget(icon: Icons.share, title: 'Share'),
               
                        VideoActionWidget(icon: Icons.play_arrow, title: 'Play'),
                    ],
                  )
              ],
            ),
          ),
        )
      ],
    );
  }
}


class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  
  final String title;
 const VideoActionWidget({super.key,required this.icon,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal:10 ),
      child: Column(
        children: [
          Icon(icon,color: Colors.white,
          size:30 ,
          ),
          Text(title,style: 
       const   TextStyle(
            color: whiteColor,
            fontSize: 16,
          ),)
        ],
      ),
    );
  }
}