import 'package:flutter/material.dart';
import 'package:untitled1/components/bottom_button.dart';
import 'package:untitled1/constants.dart';
import 'package:untitled1/components/reusable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
     this.bmiResult,
     this.resultText,
     this.interpretation,
  );

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
                alignment: Alignment.center,
                child: Text(
              'Your Result',
              style: kTitleTextStyle,
            )),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              kActiveCardColor,
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(() {
            Navigator.pop(context);
          }, 'RE-CALCULATE'),
        ],
      ),
    );
  }
}
