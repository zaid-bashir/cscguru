// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfNoteViewer extends StatefulWidget {
  PdfNoteViewer({Key key, this.noteUrl}) : super(key: key);
  String noteUrl;

  @override
  State<PdfNoteViewer> createState() => _PdfNoteViewerState();
}

class _PdfNoteViewerState extends State<PdfNoteViewer> {
  PdfViewerController pdfViewerController;
  final GlobalKey<SfPdfViewerState> pdfViewerState = GlobalKey();
  int pageNumber = 2;

  @override
  void initState() {
    super.initState();
    pdfViewerController = PdfViewerController();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                pdfViewerState.currentState.openBookmarkView();
              },
              icon: Icon(Icons.bookmark),
            ),
            IconButton(
              onPressed: () {
                pdfViewerController.zoomLevel = 1.25;
              },
              icon: Icon(Icons.zoom_in),
            ),
            IconButton(
              onPressed: () {
                pdfViewerController.zoomLevel = 0.75;
              },
              icon: Icon(Icons.zoom_out),
            ),
            IconButton(
              onPressed: () {
                pdfViewerController.jumpToPage(pageNumber);
                pageNumber++;
              },
              icon: Icon(Icons.arrow_downward),
            ),
            IconButton(
              onPressed: () {
                if (pageNumber <= 1) {
                  setState(() {
                    pageNumber = 1;
                  });
                }
                pageNumber--;
                pdfViewerController.jumpToPage(pageNumber);
              },
              icon: Icon(Icons.arrow_upward),
            ),
          ],
        ),
        body: SfPdfViewer.network(
          widget.noteUrl,
          controller: pdfViewerController,
          key: pdfViewerState,
        ),
      ),
    );
  }
}
