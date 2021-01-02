import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_load_jsonassets/model.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ModelUser> listModels = [];
  var loading = false;

  Future<Null> ambilData() async {
    setState(() {
      loading = true;
    });
    var datajson = 'assets/data.json';
    final respondata =
        await DefaultAssetBundle.of(context).loadString(datajson);
    var data = jsonDecode(respondata);

    // print(data);

    setState(() {
      for (Map i in data) {
        listModels.add(ModelUser.fromJson(i));
      }
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    ambilData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Load Json From Assets"),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: listModels.length,
            itemBuilder: (context, i) {
              final dataA = listModels[i];
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dataA.title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                      Text(
                        dataA.body,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
