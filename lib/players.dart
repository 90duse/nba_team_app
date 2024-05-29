import 'package:basketballteams/drawer.dart';
import 'package:basketballteams/logic/logic_code.dart';
import 'package:flutter/material.dart';

class Playerspage extends StatelessWidget {
  const Playerspage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 186, 186, 186),
      appBar: AppBar(
        title: const Text('Basktell Teams'),
        backgroundColor: const Color.fromARGB(255, 186, 186, 186),
      ),
      drawer: Mydrawer(),
      body: FutureBuilder(
          future: showplayers(),
          builder: ((context, snapshot) {
            // if loading is done
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: players.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListTile(
                      tileColor: Colors.white,
                      title: Row(
                        children: [
                          Text(players[index].firstname),
                          Text(players[index].lastname),
                        ],
                      ),
                      subtitle: Text(players[index].lastname),
                      leading: Row(
                        children: [
                          Text(players[index].jerseynumber),
                          Text(players[index].height.toString()),
                          Text(players[index].weight.toString()),
                        ],
                      ),
                      trailing: Text(players[index].nationality),
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
