// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, avoid_print, avoid_unnecessary_containers, non_constant_identifier_names
import 'package:cscguru/consts/textstyles.dart';
import 'package:cscguru/models/semester_model.dart';
import 'package:cscguru/services/ApiServices/apiservice.dart';
import 'package:cscguru/utils/apiresponse.dart';
import 'package:cscguru/views/widgets/custum_loader.dart';
import 'package:flutter/material.dart';

import 'semester1st/semester_1st.dart';
import 'semester2nd/semester_2nd.dart';
import 'semester3rd/semester_3rd.dart';
import 'semester4th/semester_4th.dart';
import 'semester5th/semester_5th.dart';
import 'semester6th/semester_6th.dart';

class VideosHome extends StatefulWidget {
  const VideosHome({Key key}) : super(key: key);

  @override
  _VideosHomeState createState() => _VideosHomeState();
}

class _VideosHomeState extends State<VideosHome> {
  bool isLoading = false;
  ApiService apiService = ApiService();
  ApiResponse<List<SemesterModel>> apiResponse;

  fetchStudents() async {
    setState(() {
      isLoading = true;
    });
    apiResponse = await apiService.getSemesters();
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
        title: Text("Videos"),
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
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        if (index == 0) {
                          return Videos1st();
                        }
                        if (index == 1) {
                          return Videos2nd();
                        }
                        if (index == 2) {
                          return Videos3rd();
                        }
                        if (index == 3) {
                          return Videos4th();
                        }
                        if (index == 4) {
                          return Videos5th();
                        }
                        return Videos6th();
                      },
                    ),
                  );
                },
                child: Card(
                  elevation: 20,
                  shadowColor: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListTile(
                      leading: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[100],
                        ),
                        child: Image.network(
                          "${apiResponse.data[index].imageUrl}",
                          fit: BoxFit.contain,
                        ),
                      ),
                      title: Text(
                        "${apiResponse.data[index].semesterName}",
                        style: TextStyles.cardText,
                      ),
                      subtitle: Text(
                        "${apiResponse.data[index].courseName}",
                        style: TextStyles.cardText,
                      ),
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
