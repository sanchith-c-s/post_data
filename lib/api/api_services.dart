
import 'dart:convert';

import 'package:post_data/model/post_model/post_model.dart';
import 'package:http/http.dart' as http;
class ApiServices{

  static Future<List<PostModel>?>? getPostWithModel()async{

    try{
      var response= await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts')); 

      if(response.statusCode==200){
        List<PostModel> model = List<PostModel>.from(json.decode(response.body).map((x)=>PostModel.fromJson(x)));
        return model;
      }
    }catch (e){
      print(e.toString());
    }

    return null;
  }
}