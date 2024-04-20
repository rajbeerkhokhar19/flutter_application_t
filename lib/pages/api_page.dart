import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiPage extends StatefulWidget {
  @override
  _ApiPageState createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {
  String _data = 'Fetching data...';

  void fetchData() async {
    var url = Uri.parse('https://api.example.com/data');
    var response = await http.get(url);
    var decoded = json.decode(response.body);
    setState(() {
      _data = decoded['some_field'];
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Data'),
      ),
      body: Center(
        child: Text(_data),
      ),
    );
  }
}
