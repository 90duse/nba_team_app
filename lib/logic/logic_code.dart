import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Team {
  String city;
  String teamname;
  String abbreviation;
  String division;

  Team(
      {required this.city,
      required this.teamname,
      required this.abbreviation,
      required this.division});
}

List<Team> teams = [];

Future<void> getTeam() async {
  var mykey = '4848e84a-ddb0-479c-9981-42f13a786ca3';
  try {
    var a;
    var url = Uri.https('api.balldontlie.io', 'v1/teams');
    var headers = {
      'Authorization': mykey,
    };
    var response = await http.get(url, headers: headers);

    if (response.statusCode == 200) {
      var jsonstring = jsonDecode(response.body);
      for (var eachTeam in jsonstring['data']) {
        final team = Team(
          abbreviation: eachTeam['abbreviation'],
          city: eachTeam['city'],
          teamname: eachTeam['full_name'],
          division: eachTeam['division'],
        );
        teams.add(team);
      }
      //displaymessage(teams.length);
    } else {
      displaymessage('Failed to fetch teams: ${response.body}');
    }
  } catch (e) {
    displaymessage('Unknown exception occurred: $e');
  }
}

displaymessage(message) {
  return message; // For testing purposes, replace with UI update in Flutter
}
