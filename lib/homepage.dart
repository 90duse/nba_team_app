import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  // get team function
  Future getTeam() async {
    var response = await http.get(Uri.https("api.balldontlie.io", "/v1/teams"));
    // ignore: avoid_print
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getTeam();
    return Scaffold();
  }
}
