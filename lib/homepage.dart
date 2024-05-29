import 'package:basketballteams/logic/logic_code.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});
  @override
  Widget build(BuildContext context) {
    getTeam();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 242, 249),
      appBar: AppBar(
        title: const Text('Basktell Teams'),
        backgroundColor: const Color.fromARGB(255, 30, 128, 234),
      ),
      body: FutureBuilder(
          future: getTeam(),
          builder: ((context, snapshot) {
            // if loading is done
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: teams.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(teams[index].teamname),
                    subtitle: Text(teams[index].city),
                    leading: Text(teams[index].abbreviation),
                    trailing: Text(teams[index].division),
                  );
                },
              );
            }

            //else if still loading
            else {
              return Center(child: CircularProgressIndicator());
            }
          })),
    );
  }
}
