import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
class Apiservice {
 static late Dio dio;
  static initdio(){
    dio=Dio();
  }
static final String baseurl="https://www.googleapis.com/books/v1/";
static Future<Map<String,dynamic>>  get({required String endpoint})async{
   var response=await dio.get(baseurl+endpoint);
   return response.data;

  }
}