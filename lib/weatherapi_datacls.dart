import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
// import 'package:http_parser/http_parser.dart' as http;
import 'package:weatherapp_adv/weathr_model.dart';

// 44cf1c04c000419693b93338232001

class WhetherData{
  Future<Wether>getWhetherData(String place)
  async{
    try{
      final queryParameters={
        'key':'44cf1c04c000419693b93338232001',
        'q':place
      };
      final uri=Uri.http('api.weatherapi.com','/v1/current.json',queryParameters);
      final response= await http.get(uri);
      if(response.statusCode==200){
        return Wether.fromJson(jsonDecode(response.body));
      }
      else{
        throw Exception("Can't Get !!");
      }
    }
    catch(e){
      rethrow;
    }
  }
}