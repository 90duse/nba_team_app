import 'package:basketballteams/drawer.dart';
import 'package:basketballteams/logic/logic_code.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 186, 186, 186),
      appBar: AppBar(
        title: const Text('Basktell Teams'),
        backgroundColor: Color.fromARGB(255, 30, 202, 240),
      ),
      drawer: const Mydrawer(),
      body: FutureBuilder(
          future: getTeam(),
          builder: ((context, snapshot) {
            // if loading is done
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Text(teams[index].teamname),
                      subtitle: Text(teams[index].city),
                      leading: Text(teams[index].abbreviation),
                      trailing: Text(teams[index].division),
                    ),
                  );
                },
              );
            }

            //else if still loading
            else {
              return const Center(child: CircularProgressIndicator());
            }
          })),
    );
  }
}
