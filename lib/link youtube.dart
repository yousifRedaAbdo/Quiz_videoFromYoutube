import 'package:flutter/material.dart';
import 'package:taskk/MyApplication.dart';
import 'package:taskk/videoScreen/video_screen.dart';

class link extends StatefulWidget {

  @override
  State<link> createState() => _linkState();
}

class _linkState extends State<link> {
  dynamic emailController = TextEditingController();
  String _text = '';
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Enter text here',
                  border: OutlineInputBorder(),
                ),
              )
            ),
          ),
          SizedBox(height: 10,),
          MaterialButton(
            color: Colors.blue,
              child: Text("go to watch video",style: TextStyle(color: Colors.white),),
              onPressed: (){
                myApplication.navigateTo(VideoPlayerScreen(videoId: _text), context);
              }
          ),
        ],
      ),
    );
  }
}
