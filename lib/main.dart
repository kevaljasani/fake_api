import 'package:dio/dio.dart';
import 'package:fake_api/second.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(MaterialApp(home: first(),));
}

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {

  final dio = Dio();
  List l=[];

  @override
  void initState() {
    get();
  }

  get()
  async {
    final response = await dio.get('https://fakestoreapi.com/products');
    l=response.data;
    print(l);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

      body: ListView.builder(
        itemCount: l.length,
        itemBuilder: (context, index) {
          demo d=demo.fromJson(l[index]);
        return ListTile(
            title: Text("${d.title}",style: TextStyle(color: Colors.black),),
            subtitle: Text("${d.price}"),
          leading: Image.network("${d.image}"),
          );

      },),

    );
  }
}
