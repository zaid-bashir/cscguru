//For LocalHost Testing
//=====================

// static var kbaseUrl = "http://192.168.225.244:3000";

class ApiUrls {
  static const kbaseUrl = "https://cscguru.herokuapp.com";
  static const kotpLogin = "/users/otpLogin";
  static const kverifyOTP = "/users/verifyOTP";
  static const klogin = kbaseUrl + "/users/login";
  static const kregister = kbaseUrl + "/users/register";
  static const kuserprofile = kbaseUrl + "/users/user-profile";
  static const kSemesterList = kbaseUrl + "/semester";
  static const kSyllbus1stSemesterList = kbaseUrl + "/syllbus/1st/";
  static const kSyllbus2ndSemesterList = kbaseUrl + "/syllbus/2nd/";
  static const kSyllbus3rdSemesterList = kbaseUrl + "/syllbus/3rd/";
  static const kSyllbus4thSemesterList = kbaseUrl + "/syllbus/4th/";
  static const kSyllbus5thSemesterList = kbaseUrl + "/syllbus/5th/";
  static const kSyllbus6thSemesterList = kbaseUrl + "/syllbus/6th/";
  static const kVideosProgrammingUsingCCpp =
      kbaseUrl + "/videos/1st/programming_fundamentals_using_c_cpp";
  static const knotesProgrammingUsingCCpp =
      kbaseUrl + "/notes/1st/programming_fundamentals_using_c_cpp";
  static const knotesComputingMathematics =
      kbaseUrl + "/notes/1st/computing_mathematics";
  static const knotesEnvironmentalStudies =
      kbaseUrl + "/notes/1st/environmental_studies";
}
