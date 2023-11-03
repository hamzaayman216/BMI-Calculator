import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:untitled1/screens/results_page.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import 'results_page.dart';
import '../components/bottom_button.dart';
import '../components/round_icon_button.dart';
import 'package:untitled1/calculator_brain.dart';



enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      selectedGender == Gender.male
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      IconContent(FontAwesomeIcons.mars, 'Male'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      selectedGender == Gender.female
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      IconContent(FontAwesomeIcons.venus, 'Female'),
                    ),
                  ),
                ),
              ],
            )),
            Expanded(
              child: ReusableCard(
                kActiveCardColor,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Height',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: kNumberTextStyle,
                        ),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                        min: 120.0,
                        max: 220.0,
                        //activeColor: Color(0xFFEB1555),
                        inactiveColor: Color(0xFF8D8E98),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  kActiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ), () {
                            setState(() {
                              weight--;
                            });
                          }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ), () {
                            setState(() {
                              weight++;
                            });
                          }),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  kActiveCardColor,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: kLabelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                              Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white,
                              ), () {
                            setState(() {
                              age--;
                            });
                          }),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                              Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white,
                              ), () {
                            setState(() {
                              age++;
                            });
                          }),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            )),
            BottomButton(
              () {
                CalculatorBrain calc=CalculatorBrain(weight, height);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultsPage(
                      calc.calculateBMI(),calc.getResults(),calc.getInterpretation()
                    )));
              },
              'CALCULATE',
            ),
          ],
        ));
  }
}



