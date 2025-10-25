import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity 4',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity 4'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // LOCAL IMAGE
            const Text(
              'Local Image',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            Image.asset(
              'assets/local-image.jpg',
              height: 150,
            ),

            const SizedBox(height: 40),

            // NETWORK IMAGE
            const Text(
              'Network Image',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            Image.network(
              'https://scontent.fceb2-2.fna.fbcdn.net/v/t39.30808-6/545861947_1631186191619354_4603219118716017170_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=107&ccb=1-7&_nc_sid=6ee11a&_nc_eui2=AeFK2IpeurcEbQnjvdmlSCsYxC0qbXJu3sjELSptcm7eyCNMUFdc5Q5Pvb0zC7BxLqV_FBnZkQWszApqicPtPHBO&_nc_ohc=njPCr65Yv0wQ7kNvwEfbHI8&_nc_oc=AdlkgXyXU_7-1Pa-LfNglIPxQkV7rv_ZlBYhr6dFdbBWW88kUhC4y6zMT7Rs8s4Reic&_nc_zt=23&_nc_ht=scontent.fceb2-2.fna&_nc_gid=nK8shszEhi1MgZ19k6PQaQ&oh=00_Afcih87MtlxOOQX2Fcb9gk67HCILmiJgxX_No9Vx--f5pg&oe=68FC0007',
              height: 150,
            ),

            const SizedBox(height: 40),

            // ICONS
            const Text(
              'Icons',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.favorite,
                  color: Colors.teal,
                  size: 40,
                ),
                SizedBox(width: 20),
                Icon(
                  Icons.star,
                  color: Colors.teal,
                  size: 40,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
