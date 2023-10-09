import 'package:flutter/material.dart';
import 'package:taskk/MyApplication.dart';
import 'package:taskk/link%20youtube.dart';
import 'package:taskk/quizScreen/quiz_screen.dart';
import 'package:taskk/videoScreen/video_screen.dart';

class ChoseScreene extends StatelessWidget {
  const ChoseScreene({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 25,),
            InkWell(
              onTap: () => myApplication.navigateTo(
                 QuizScreen() ,
                  context),
                child: ClipRRect(
                 borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: const BoxDecoration(color: Colors.teal),
                    child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("MCQ",style: TextStyle(fontSize: 24,color: Colors.white),),
                            Icon(Icons.quiz,size: 70,color: Colors.white,),
                          ],
                        )
                    ),
                  ),
                )
              ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () => myApplication.navigateTo(
                  link(),
                  context),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: const BoxDecoration(color:Colors.cyanAccent),
                    child: Center(
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: const [
                             Text("Video",style: TextStyle(fontSize: 24,color: Colors.black),),
                             Icon(Icons.ondemand_video,size: 70,color: Colors.black,),
                           ],
                         )),
                  ),
                )
              ),
          ],
        ),
      ),
    );
  }
}
