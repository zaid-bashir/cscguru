// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_adjacent_string_concatenation

import 'package:cscguru/consts/textstyles.dart';
import 'package:cscguru/models/syllbusmodel.dart';
import 'package:cscguru/services/ApiServices/apiservice.dart';
import 'package:cscguru/services/syllbus_download/syllbus_service.dart';
import 'package:cscguru/utils/apiresponse.dart';
import 'package:cscguru/views/widgets/custum_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';

class Semester4th extends StatefulWidget {
  const Semester4th({Key key}) : super(key: key);

  @override
  _Semester4thState createState() => _Semester4thState();
}

class _Semester4thState extends State<Semester4th> {
  bool isLoading = false;
  ApiService apiService = ApiService();
  ApiResponse<List<SyllbusModel>> apiResponse;

  fetchSyllbus4thsemester() async {
    setState(() {
      isLoading = true;
    });
    apiResponse = await apiService.getSyllbus4thSemester();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchSyllbus4thsemester();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Semester IV | BCA"),
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
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Subject Details",
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 22,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Course Name : ${apiResponse.data[index].courseName}",
                                    style: TextStyles.syllbusDetailsText,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Course Code : ${apiResponse.data[index].courseCode}",
                                    style: TextStyles.syllbusDetailsText,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Subject Code : ${apiResponse.data[index].subjectCode}",
                                    style: TextStyles.syllbusDetailsText,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Batch : ${apiResponse.data[index].batch}",
                                    style: TextStyles.syllbusDetailsText,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Credits : ${apiResponse.data[index].credits}",
                                    style: TextStyles.syllbusDetailsText,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Duration : ${apiResponse.data[index].duration}",
                                    style: TextStyles.syllbusDetailsText,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Stage Type : ${apiResponse.data[index].stageType}",
                                    style: TextStyles.syllbusDetailsText,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: 3,
                            decoration: BoxDecoration(
                              color: Colors.red,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GFButton(
                                    onPressed: () {
                                      SyllbusService().openFile(
                                        url: apiResponse.data[index].fileUrl,
                                        filename:
                                            "${apiResponse.data[index].subjectName}" +
                                                ".pdf",
                                      );
                                    },
                                    text: "Download",
                                    type: GFButtonType.solid,
                                    blockButton: true,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GFButton(
                                    onPressed: () {
                                      SyllbusService().viewFile(
                                        url: apiResponse.data[index].fileUrl,
                                        filename:
                                            "${apiResponse.data[index].subjectName}" +
                                                ".pdf",
                                      );
                                    },
                                    text: "View",
                                    type: GFButtonType.solid,
                                    blockButton: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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
