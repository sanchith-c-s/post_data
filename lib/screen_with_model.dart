import 'package:flutter/material.dart';
import 'package:post_data/api/api_services.dart';
import 'package:post_data/model/post_model/post_model.dart';

class ScreenWithModel extends StatefulWidget {
  const ScreenWithModel({super.key});

  @override
  State<ScreenWithModel> createState() => _ScreenWithModelState();
}

class _ScreenWithModelState extends State<ScreenWithModel> {

  List<PostModel> postModel=[];
  bool isReady = false;
   @override
  void initState() {
    fetch();
    super.initState();
  }

  fetch() async {
    isReady=true;
    ApiServices.getPostWithModel()?.then((value) {
      setState(() {
        postModel = value!;
        isReady = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post with model"),
        centerTitle: true,
      ),
      body: isReady==true?
      Center(
        child: CircularProgressIndicator(),
      ):
      ListView.builder(
        itemCount: postModel.length,
        itemBuilder: (context,index) {
          return Card(
            margin: EdgeInsets.all(10),
            child:ListTile(
              leading: Text(postModel[index].id.toString()),
              title: Text(postModel[index].title.toString()),
              subtitle:Text(postModel[index].body.toString()), 

            ) ,
          );
        })
    );
  }
}