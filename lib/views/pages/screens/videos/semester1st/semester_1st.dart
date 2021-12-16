// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations
import 'package:cscguru/models/syllbusmodel.dart';
import 'package:cscguru/services/ApiServices/apiservice.dart';
import 'package:cscguru/utils/apiresponse.dart';
import 'package:cscguru/views/pages/screens/videos/semester1st/video_courses/programming_fundamentals_using_c_cpp.dart';
import 'package:cscguru/views/widgets/custum_loader.dart';
import 'package:cscguru/services/youtube_video/custum_youtube_player.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';

class Videos1st extends StatefulWidget {
  const Videos1st({Key key}) : super(key: key);

  @override
  _Videos1stState createState() => _Videos1stState();
}

class _Videos1stState extends State<Videos1st> {
  bool isLoading = false;
  ApiService apiService = ApiService();
  ApiResponse<List<SyllbusModel>> apiResponse;

  fetchSyllbus1stsemester() async {
    setState(() {
      isLoading = true;
    });
    apiResponse = await apiService.getSyllbus1stSemester();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchSyllbus1stsemester();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Semester I || BCA"),
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
              return Padding(
                padding: const EdgeInsets.all(8.0),
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
                            "${apiResponse.data[index].subjectImage}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${apiResponse.data[index].subjectName}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w900),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GFButton(
                            color: Colors.red,
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProgrammingFuntalsUsingCCpp(),
                                ),
                              );
                            },
                            text: "Watch Course",
                            blockButton: true,
                            icon: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
              ); //Card
            },
          );
        }),
      ),
    );
  }
}
