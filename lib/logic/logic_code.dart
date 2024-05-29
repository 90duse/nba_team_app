import 'dart:convert';

import 'package:basketballteams/homepage.dart';
import 'package:basketballteams/players.dart';
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

class Player {
  String firstname;
  String lastname;
  int height;
  int weight;
  String jerseynumber;
  String nationality;

  Player({
    required this.firstname,
    required this.height,
    required this.jerseynumber,
    required this.lastname,
    required this.nationality,
    required this.weight,
  });
}

List<Team> teams = [];
List<Player> players = [];

Future<void> getTeam() async {
  var mykey = '4848e84a-ddb0-479c-9981-42f13a786ca3';
  try {
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

Future<void> showplayers() async {
  var mykey = '4848e84a-ddb0-479c-9981-42f13a786ca3';
  try {
    var url = Uri.https('api.balldontlie.io', '/v1/players');
    var headers = {
      'Authorization': mykey,
    };
    var response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var jsondata = jsonDecode(response.body);
      //displaymessage(response.body);
      for (var eachplayer in jsondata) {
        final playerinfo = Player(
            firstname: eachplayer['first_name'],
            height: eachplayer['height'],
            jerseynumber: eachplayer['jersey_number'],
            lastname: eachplayer['last_name'],
            nationality: eachplayer['country'],
            weight: eachplayer['weight']);
        players.add(playerinfo);
      }
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

// "first_name": "Stephen",
//       "last_name": "Curry",
//       "position": "G",
//       "height": "6-2",
//       "weight": "185",
//       "jersey_number": "30",
//       "college": "Davidson",
//       "country": "USA",
//       "draft_year": 2009,
//       "draft_round": 1,

var approutes = {
  "lib/homepage.dart": ((context) => Homepage()),
  "lib/players.dart": ((contex) => Playerspage()),
};
