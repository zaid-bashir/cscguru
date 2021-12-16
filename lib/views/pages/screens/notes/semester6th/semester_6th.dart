// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_adjacent_string_concatenation

import 'package:cscguru/models/syllbusmodel.dart';
import 'package:cscguru/services/ApiServices/apiservice.dart';
import 'package:cscguru/utils/apiresponse.dart';
import 'package:cscguru/views/widgets/custum_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Semester6th extends StatefulWidget {
  const Semester6th({Key key}) : super(key: key);

  @override
  _Semester6thState createState() => _Semester6thState();
}

class _Semester6thState extends State<Semester6th> {
  bool isLoading = false;
  ApiService apiService = ApiService();
  ApiResponse<List<SyllbusModel>> apiResponse;

  fetchSyllbus6thsemester() async {
    setState(() {
      isLoading = true;
    });
    apiResponse = await apiService.getSyllbus6thSemester();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchSyllbus6thsemester();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Semester VI | BCA"),
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
