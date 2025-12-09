import 'package:flutter/material.dart';
import 'package:tp1/quizz.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'tp1',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfileHomePage(),
    );
  }
}

class ProfileHomePage extends StatelessWidget {
  const ProfileHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Bienvenue!",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Container(
        color: Colors.blue[50],
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/profil.png'),
            ),
            const SizedBox(height: 16),
            Container(
              width: 260,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: const Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Ayoub Goussem",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text("Etudiant M2 IASD",
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),

                  SizedBox(height: 4),

                  Text("Montpellier, France"),
                  SizedBox(height: 8),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.phone, size: 18),
                      SizedBox(width: 6),
                      Text("+33 7 53 00 00"),
                    ],
                  ),

                  SizedBox(height: 8),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.email, size: 18),
                      SizedBox(width: 6),
                      Text("ayoubgoussem@tuta.io"),
                    ],
                  ),

                  SizedBox(height: 4),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.alternate_email, size: 18),
                      SizedBox(width: 6),
                      Text("linkedin.com/ayoub-goussem"),
                    ],
                  ),
                  SizedBox(height: 4),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.code, size: 18),
                      SizedBox(width: 6),
                      Text("github.com/ayoub_goussem")
                    ],
                  )
                ],
              ),



            ),

            const SizedBox(height: 16),

            Container(
              width: 260,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  foregroundColor: Colors.black87,
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => QuizzPage(title: 'Questions/Réponses'),
                    ),
                  );
                },
                child: const Text('Aller au quizz'),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
