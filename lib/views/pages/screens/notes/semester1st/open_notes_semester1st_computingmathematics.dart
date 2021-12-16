// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, must_be_immutable

import 'package:cscguru/models/note_model.dart';
import 'package:cscguru/services/ApiServices/apiservice.dart';
import 'package:cscguru/utils/apiresponse.dart';
import 'package:cscguru/views/pages/screens/notes/pdf_note_viewer.dart';
import 'package:cscguru/views/widgets/custum_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/types/gf_button_type.dart';

class OpenNotesSemester1stComputingMathematics extends StatefulWidget {
  OpenNotesSemester1stComputingMathematics({Key key, this.subjectCode})
      : super(key: key);

  String subjectCode;

  @override
  OpenNotesSemester1stComputingMathematicsState createState() =>
      OpenNotesSemester1stComputingMathematicsState();
}

class OpenNotesSemester1stComputingMathematicsState
    extends State<OpenNotesSemester1stComputingMathematics> {
  bool isLoading = false;
  ApiService apiService = ApiService();
  ApiResponse<List<NoteModel>> apiResponse;

  fetchNotes1stsemesterComputingMathematics() async {
    setState(() {
      isLoading = true;
    });
    apiResponse = await apiService.getNotesComputingMathematics();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchNotes1stsemesterComputingMathematics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.subjectCode),
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
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.network(
                            "https://cdn2.iconfinder.com/data/icons/file-formats-3-1/100/file_formats3_pdf-512.png",
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${apiResponse.data[index].noteName}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w900),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${apiResponse.data[index].type}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.document_scanner)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: GFButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PdfNoteViewer(
                                      noteUrl: apiResponse.data[index].noteUrl,
                                    ),
                                  ),
                                );
                              },
                              text: "View Note",
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
