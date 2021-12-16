// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_adjacent_string_concatenation

import 'package:cscguru/models/syllbusmodel.dart';
import 'package:cscguru/services/ApiServices/apiservice.dart';
import 'package:cscguru/utils/apiresponse.dart';
import 'package:cscguru/views/pages/screens/notes/semester1st/open_notes_semester1st_computingmathematics.dart';
import 'package:cscguru/views/pages/screens/notes/semester1st/open_notes_semester1st_environmentalstudies.dart';
import 'package:cscguru/views/pages/screens/notes/semester1st/open_notes_semester1st_programmingusingccpp.dart';
import 'package:cscguru/views/widgets/custum_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';

class Semester1st extends StatefulWidget {
  const Semester1st({Key key}) : super(key: key);

  @override
  Semester1stState createState() => Semester1stState();
}

class Semester1stState extends State<Semester1st> {
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
        title: Text("Semester I | BCA"),
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
          return ListView.separated(
            itemCount: apiResponse.data.length,
            separatorBuilder: (context, index) {
              return Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  Divider(
                    height: 4,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                ],
              );
            },
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${apiResponse.data[index].subjectName}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w900),
                        ),
                      ),
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
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GFButton(
                              onPressed: () {
                                if (index == 0) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          OpenNotesSemester1stProgrammingUsingCCpp(
                                        subjectCode:
                                            apiResponse.data[index].subjectCode,
                                      ),
                                    ),
                                  );
                                }
                                if (index == 1) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          OpenNotesSemester1stComputingMathematics(
                                        subjectCode:
                                            apiResponse.data[index].subjectCode,
                                      ),
                                    ),
                                  );
                                }
                                if (index == 2) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          OpenNotesSemester1stEnvironmentalStudies(
                                        subjectCode:
                                            apiResponse.data[index].subjectCode,
                                      ),
                                    ),
                                  );
                                }
                              },
                              text: "Open Notes",
                              type: GFButtonType.solid,
                              blockButton: true,
                              color: Colors.red,
                              icon: Icon(
                                Icons.read_more,
                                color: Colors.white,
                              ),
                            )),
                      ),
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
