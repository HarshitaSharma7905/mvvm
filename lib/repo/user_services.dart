import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart'as http;
import 'package:mvvm/model/Model.dart';
import 'package:mvvm/repo/api_status.dart';

import '../utils/constants.dart';
class UserServices{
  static Future<Object> getUsers() async{
    try{
      var url=Uri.parse(USERS_LIST);
      var response=await http.get(url);
      if(response.statusCode==200){
        return Success(code: 200, response: modelFromJson(response.body));
      }
        return Failure(code:USER_INVALID_RESPONSE, errorResponse: 'Invalid Response');

    } on HttpException{
      return Failure(code: NO_INTERNET, errorResponse: 'No Internet');
    } on FormatException{
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    }
    catch(e){
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
      
    }
  }

}