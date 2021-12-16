// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:cscguru/consts/apiurls.dart';
import 'package:cscguru/models/note_model.dart';
import 'package:cscguru/models/video_model.dart';
import 'package:cscguru/models/syllbusmodel.dart';
import 'package:cscguru/utils/apiresponse.dart';
import 'package:http/http.dart' as http;
import 'package:cscguru/models/semester_model.dart';

class ApiService {
  Future<ApiResponse<List<SemesterModel>>> getSemesters() async {
    final url = Uri.parse(ApiUrls.kSemesterList);
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <SemesterModel>[];
      for (var item in jsonData) {
        list.add(SemesterModel.fromJson(item));
      }
      return ApiResponse<List<SemesterModel>>(data: list);
    }
    return ApiResponse<List<SemesterModel>>(
        error: true,
        errorMessage: "Something went Wrong , Please try again...");
  }

  Future<ApiResponse<List<SyllbusModel>>> getSyllbus1stSemester() async {
    final url = Uri.parse(ApiUrls.kSyllbus1stSemesterList);
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <SyllbusModel>[];
      for (var item in jsonData) {
        list.add(SyllbusModel.fromJson(item));
      }
      return ApiResponse<List<SyllbusModel>>(data: list);
    }
    return ApiResponse<List<SyllbusModel>>(
        error: true,
        errorMessage: "Something went Wrong , Please try again...");
  }

  Future<ApiResponse<List<SyllbusModel>>> getSyllbus2ndSemester() async {
    final url = Uri.parse(ApiUrls.kSyllbus2ndSemesterList);
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <SyllbusModel>[];
      for (var item in jsonData) {
        list.add(SyllbusModel.fromJson(item));
      }
      return ApiResponse<List<SyllbusModel>>(data: list);
    }
    return ApiResponse<List<SyllbusModel>>(
        error: true,
        errorMessage: "Something went Wrong , Please try again...");
  }

  Future<ApiResponse<List<SyllbusModel>>> getSyllbus3rdSemester() async {
    final url = Uri.parse(ApiUrls.kSyllbus3rdSemesterList);
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <SyllbusModel>[];
      for (var item in jsonData) {
        list.add(SyllbusModel.fromJson(item));
      }
      return ApiResponse<List<SyllbusModel>>(data: list);
    }
    return ApiResponse<List<SyllbusModel>>(
        error: true,
        errorMessage: "Something went Wrong , Please try again...");
  }

  Future<ApiResponse<List<SyllbusModel>>> getSyllbus4thSemester() async {
    final url = Uri.parse(ApiUrls.kSyllbus4thSemesterList);
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <SyllbusModel>[];
      for (var item in jsonData) {
        list.add(SyllbusModel.fromJson(item));
      }
      return ApiResponse<List<SyllbusModel>>(data: list);
    }
    return ApiResponse<List<SyllbusModel>>(
        error: true,
        errorMessage: "Something went Wrong , Please try again...");
  }

  Future<ApiResponse<List<SyllbusModel>>> getSyllbus5thSemester() async {
    final url = Uri.parse(ApiUrls.kSyllbus5thSemesterList);
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <SyllbusModel>[];
      for (var item in jsonData) {
        list.add(SyllbusModel.fromJson(item));
      }
      return ApiResponse<List<SyllbusModel>>(data: list);
    }
    return ApiResponse<List<SyllbusModel>>(
        error: true,
        errorMessage: "Something went Wrong , Please try again...");
  }

  Future<ApiResponse<List<SyllbusModel>>> getSyllbus6thSemester() async {
    final url = Uri.parse(ApiUrls.kSyllbus6thSemesterList);
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <SyllbusModel>[];
      for (var item in jsonData) {
        list.add(SyllbusModel.fromJson(item));
      }
      return ApiResponse<List<SyllbusModel>>(data: list);
    }
    return ApiResponse<List<SyllbusModel>>(
        error: true,
        errorMessage: "Something went Wrong , Please try again...");
  }

  Future<ApiResponse<List<VideosModel>>> getVideosProgrammingUsingCCpp() async {
    final url = Uri.parse(ApiUrls.kVideosProgrammingUsingCCpp);
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <VideosModel>[];
      for (var item in jsonData) {
        list.add(VideosModel.fromJson(item));
      }
      return ApiResponse<List<VideosModel>>(data: list);
    }
    return ApiResponse<List<VideosModel>>(
        error: true,
        errorMessage: "Something went Wrong , Please try again...");
  }

  Future<ApiResponse<List<NoteModel>>> getNotesProgrammingUsingCCpp() async {
    final url = Uri.parse(ApiUrls.knotesProgrammingUsingCCpp);
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <NoteModel>[];
      for (var item in jsonData) {
        list.add(NoteModel.fromJson(item));
      }
      return ApiResponse<List<NoteModel>>(data: list);
    }
    return ApiResponse<List<NoteModel>>(
        error: true,
        errorMessage: "Something went Wrong , Please try again...");
  }

  Future<ApiResponse<List<NoteModel>>> getNotesComputingMathematics() async {
    final url = Uri.parse(ApiUrls.knotesComputingMathematics);
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <NoteModel>[];
      for (var item in jsonData) {
        list.add(NoteModel.fromJson(item));
      }
      return ApiResponse<List<NoteModel>>(data: list);
    }
    return ApiResponse<List<NoteModel>>(
        error: true,
        errorMessage: "Something went Wrong , Please try again...");
  }

  Future<ApiResponse<List<NoteModel>>> getNotesEnvironmentalStudies() async {
    final url = Uri.parse(ApiUrls.knotesEnvironmentalStudies);
    final response = await http.get(url);
    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = <NoteModel>[];
      for (var item in jsonData) {
        list.add(NoteModel.fromJson(item));
      }
      return ApiResponse<List<NoteModel>>(data: list);
    }
    return ApiResponse<List<NoteModel>>(
        error: true,
        errorMessage: "Something went Wrong , Please try again...");
  }
}
