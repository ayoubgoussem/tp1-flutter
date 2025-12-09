import 'package:flutter/material.dart';

class QuizzPage extends StatefulWidget {
  const QuizzPage({super.key, required this.title});

  final String title;

  @override
  State<QuizzPage> createState() => _QuizzPageState();
}


class Question {
  final String text;
  final bool isCorrect;
  final String imagePath;

  Question({required this.text, required this.isCorrect, required this.imagePath});
}

class _QuizzPageState extends State<QuizzPage> {
  final List<Question> _questions = [
    Question(
      text: "L'avocat est classé botaniquement comme un fruit.",
      isCorrect: true,
      imagePath: 'assets/avocat.png'
    ),
    Question(
      text: "La rhubarbe est un fruit car on en mange les tiges sucrées.",
      isCorrect: false,
      imagePath: 'assets/rhubarbe.png'
    ),
    Question(
      text: "La banane est une baie au sens botanique",
      isCorrect: true,
      imagePath: 'assets/banane.png'
    ),
    Question(
      text: "Le poivron rouge contient en moyenne plus de vitamine C qu'une orange.",
      isCorrect: true,
      imagePath: 'assets/poivron.png'
    ),
    Question(
      text: "L'aubergine appartient à la même famille botanique que la tomate.",
      isCorrect: true,
      imagePath: 'assets/aubergine.png'
    ),
  ];


  int _currentIndex = 0;
  final List<bool> _userResults = [];

  void _answer(bool userChoice) {
    final question = _questions[_currentIndex];
    final isGood = (userChoice == question.isCorrect);
    _userResults.add(isGood);

    if (_currentIndex < _questions.length - 1) {
      setState(() {
        _currentIndex++;
      });
    } else {
      _showSummary();
    }
  }

  void _showSummary() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => SummaryPage(
          questions: _questions,
          results: _userResults,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        elevation: 0,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Container(
          width: 300,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Question ${_currentIndex + 1}/${_questions.length}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              if(question.imagePath.isNotEmpty)
                Padding(padding: const EdgeInsets.only(bottom: 16),
                child: Image.asset(
                  question.imagePath,
                  height: 120,
                    fit:BoxFit.contain,
                ),),
              Text(
                question.text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 120,
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
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () => _answer(true),
                      child: const Text('VRAI'),
                    ),
                  ),
                  Container(
                    width: 120,
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
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      onPressed: () => _answer(false),
                      child: const Text('FAUX'),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}


class SummaryPage extends StatelessWidget {
  const SummaryPage({
    super.key,
    required this.questions,
    required this.results,
  });

  final List<Question> questions;
  final List<bool> results;

  @override
  Widget build(BuildContext context) {
    final int goodCount = results.where((r) => r).length;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Récapitulatif",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Container(
          width: 320,
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Score : $goodCount / ${questions.length}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              ...List.generate(questions.length, (i) {
                final isGood = results[i];
                return Row(
                  children: [
                    Icon(
                      isGood ? Icons.check_circle : Icons.cancel,
                      color: isGood ? Colors.green : Colors.red,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        questions[i].text,
                        style: TextStyle(
                          color: isGood ? Colors.green[800] : Colors.red[800],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
