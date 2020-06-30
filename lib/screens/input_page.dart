import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results.dart';
import 'package:bmi/constants.dart';
import 'package:bmi/components/icon_content.dart';
import 'package:bmi/components/reusable_card.dart';
import 'package:bmi/components/botton_button.dart';
import 'package:bmi/components/round_icon_button.dart';
import 'calculator_brain.dart';





enum Gender {
  male, female,
  }

 class InputPage extends StatefulWidget {
  
    @override
    _InputPageState createState() => _InputPageState();
  }
  
  class _InputPageState extends State<InputPage> {

    Gender selectedGender;
    int height = 180;
    int weight = 60;
    int age = 19;

    /* Color maleCardColour = inactiveCardColour;
    Color femaleCardCcolour = inactiveCardColour;
    void updateColour(Gender selectedGender){
      if (selectedGender ==Gender.male){
        if(maleCardColour == inactiveCardColour){
          maleCardColour= activeCardColour;
          femaleCardCcolour =inactiveCardColour;
        }else{
          maleCardColour = inactiveCardColour;
        }
      }
      if(selectedGender==Gender.female){
        if(femaleCardCcolour==inactiveCardColour){
          femaleCardCcolour=activeCardColour;
          maleCardColour = inactiveCardColour;
        }else{
          femaleCardCcolour=inactiveCardColour;
        }
      }
    } */
    @override
    Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(
           
          title: Text('BMI CALCULATOR'),
         ),
         body: 
         Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
                Expanded(
                 child: Row(
                   children: <Widget>[ 
                      Expanded(
                        child: GestureDetector(
                          onTap: (){
                           setState(() {
                             selectedGender = Gender.male;
                           });
                          },
                            child: ReusableCard(
                              
                            colour: selectedGender == Gender.male? kactiveCardColour:kinactiveCardColour,
                            cardChild: IconContent(
                              icon: FontAwesomeIcons.mars,
                              label: 'Male',
                              ),
                          ),
                        ),
                        ),
                         Expanded(
                           child:  GestureDetector(
                             onTap: (){
                               setState(() {
                                 selectedGender = Gender.female;
                               });
                             },
                              child: ReusableCard(
                             colour: selectedGender == Gender.female?kactiveCardColour:kinactiveCardColour,
                             cardChild: IconContent(
                               icon: FontAwesomeIcons.venus,
                               label: 'Female',
                             ),
                         ),
                           ),
                          ),  

                   ],
                  ),
             ),
           
             Expanded(
               child:  ReusableCard(
                 colour: kactiveCardColour,
                 cardChild: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children:<Widget>[
                     Text(
                       'Height',
                       style: kLabelTextStyle
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       crossAxisAlignment: CrossAxisAlignment.baseline,
                       textBaseline: TextBaseline.alphabetic, //pone el 180 y el cm en el mismo piso
                       children: <Widget>[
                       Text(
                        height.toString(),
                         style:kNumberTextStyle,
                       ),
                       Text(
                         'CM',
                         style: kLabelTextStyle,
                       ),    
                     ],
                     ),
                     SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),

                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                        ),
                         child: Slider(
                         value: height.toDouble(),
                         min: 120.0,
                         max: 220.0,
                         //activeColor: Color(0xFFEB1555),
                         //inactiveColor: Color(0xFF8D8E98),
                         onChanged: (double newValue){
                           setState(() {
                            height = newValue.round();                           
                           });
                         }),
                     ),
                   ],
                 ),
              
               ),
             ),
                 Expanded(
               child: Row(
                 children: <Widget>[ 
                    Expanded(
                      child:  ReusableCard(
                        colour: kactiveCardColour,
                        cardChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:<Widget>[
                           Text(
                             'WEIGHT',
                             style: kLabelTextStyle,

                           ),
                           Text(
                            weight.toString(),
                             style: kNumberTextStyle,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                           
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              },
                              
                            ),
                           

                           SizedBox(width: 10.0,),


                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                              ],
                           ),
                          ],
                        ),
                        ),
                      ),
                       Expanded(
                         child:  ReusableCard(
                        colour: kactiveCardColour,
                        cardChild: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:<Widget>[
                           Text(
                             'AGE',
                             style: kLabelTextStyle,

                           ),
                           Text(
                            age.toString(),
                             style: kNumberTextStyle,
                           ),
                           Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                           /*  FloatingActionButton(
                            backgroundColor: Color(0xFF4C4F5E),
                            child: Icon(Icons.add),
                            onPressed: null,    */
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              },
                              
                            ),
                           

                           SizedBox(width: 10.0,),


                          RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: (){
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                              ],
                           ),
                          ],
                        ),
                        ),
                      ),
                         

                 ],
                ),
               ),
            BottonButton(
              buttonTitle: 'CALCULATE',
               onTap: (){

                   CalculatorBrain calc = CalculatorBrain(height: height, weight: weight );

                    Navigator.push(context, 
                    MaterialPageRoute(builder: (context)=>ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    )));
               },
            
            ),
         ],
          
        ),
      );
    }
  }




         

