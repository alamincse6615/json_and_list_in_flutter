import 'dart:convert';

import 'package:class_no_25/ProductDataModel.dart';
import 'package:class_no_25/details.dart';
import 'package:class_no_25/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Future<List<ProductDataModel>> jsonfunction() async{
    final jsonProduct = await rootBundle.loadString("jsonvuris/productlist.json");
    final list = json.decode(jsonProduct) as List<dynamic>;
    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: jsonfunction(),
          builder: (context, badkdsa){
          var list = badkdsa.data as List<ProductDataModel>;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context,index){
                  return InkWell(
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          SizedBox(width: 30,),
                          Image.network(
                            list[index].imageURL.toString(),
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(width: 30,),
                          Column(
                            children: [
                              Text("id : "+ list[index].id.toString(),),
                              Text("name : "+ list[index].name.toString(),),
                              Text("category : "+ list[index].category.toString(),),
                              Text("oldPrice : "+ list[index].oldPrice.toString(),),
                              Text("price : "+ list[index].price.toString(),),
                            ],
                          )
                        ],
                      ),
                    ),
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context)=>Details(
                                list[index].id.toString(),
                                list[index].name.toString(),
                                list[index].category.toString(),
                                list[index].imageURL.toString(),
                                list[index].oldPrice.toString(),
                                list[index].price.toString(),
                              )
                          )
                      );
                    },
                  );
                }
            );
          }
      )
    );
  }
}