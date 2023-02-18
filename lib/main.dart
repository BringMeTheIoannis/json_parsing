import 'package:flutter/material.dart';
import 'package:json_parsing/api/api.dart';
import 'package:json_parsing/models/office_list.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<OfficeList> _future;

  @override
  void initState() {
    super.initState();
    _future = getQuery();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: FutureBuilder<OfficeList>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: snapshot.data?.listOfInfo.length,
                  itemBuilder: (context, index) => ListTile(
                    isThreeLine: true,
                    title: Text('${snapshot.data?.listOfInfo[index].id}'),
                    subtitle:
                        Text('${snapshot.data?.listOfInfo[index].address}'),
                    leading: Image.network(
                        '${snapshot.data?.listOfInfo[index].image}'),
                  ),
                );
              })),
    );
  }
}

Future<OfficeList> getQuery() {
  return ApiModel().getData();
}
