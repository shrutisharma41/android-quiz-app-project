import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;
  Result(this.resultScore, this.resetHandler);
  String get resultPhrase {
    String resultText = 'you did it';
    if (resultScore <= 8) {
      resultText = 'you are awesome and innocent';
    } else if (resultScore <= 12) {
      resultText = 'preety likeable';
    } else if (resultScore <= 16) {
      resultText = 'you are strange!';
    } else {
      resultText = 'you are bad';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text(
              'Restart Quiz!',
            ),
            style: TextButton.styleFrom(backgroundColor: Colors.green),
            onPressed: resetHandler ,
          ),
        ],
      ),
    );
  }
}
