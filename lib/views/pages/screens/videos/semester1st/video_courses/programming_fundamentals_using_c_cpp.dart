// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:cscguru/consts/textstyles.dart';
import 'package:cscguru/models/video_model.dart';
import 'package:cscguru/services/ApiServices/apiservice.dart';
import 'package:cscguru/services/youtube_video/custum_youtube_player.dart';
import 'package:cscguru/utils/apiresponse.dart';
import 'package:cscguru/views/widgets/custum_loader.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ProgrammingFuntalsUsingCCpp extends StatefulWidget {
  const ProgrammingFuntalsUsingCCpp({Key key}) : super(key: key);

  @override
  _ProgrammingFuntalsUsingCCppState createState() =>
      _ProgrammingFuntalsUsingCCppState();
}

class _ProgrammingFuntalsUsingCCppState
    extends State<ProgrammingFuntalsUsingCCpp> {
  bool isLoading = false;
  ApiService apiService = ApiService();
  ApiResponse<List<VideosModel>> apiResponse;

  fetchStudents() async {
    setState(() {
      isLoading = true;
    });
    apiResponse = await apiService.getVideosProgrammingUsingCCpp();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Programming Using C/C++"),
      ),
      body: SafeArea(
        child: Builder(builder: (context) {
          if (isLoading) {
            return Center(
              child: CustumLoader(),
            );
          }
          if (apiResponse.error) {
            return Center(
              child: Text("${apiResponse.errorMessage}"),
            );
          }
          return ListView.builder(
            itemCount: apiResponse.data.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustumYoutubePlayer(
                                videoId: "${apiResponse.data[index].videoId}",
                              )));
                },
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Image.network(
                              "${apiResponse.data[index].thumbnailUrl}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "${apiResponse.data[index].title}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w900),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GFButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CustumYoutubePlayer(
                                            videoId:
                                                "${apiResponse.data[index].videoId}",
                                          )));
                            },
                            type: GFButtonType.solid,
                            color: Colors.red,
                            blockButton: true,
                            text: "Watch Video",
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
