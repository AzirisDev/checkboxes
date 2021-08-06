
import 'package:checkboxes/widgets/custom_checkbox.dart';
import 'package:flutter/material.dart';

class CheckboxScreen extends StatefulWidget {
  const CheckboxScreen({Key? key}) : super(key: key);

  @override
  _CheckboxScreenState createState() => _CheckboxScreenState();
}

class _CheckboxScreenState extends State<CheckboxScreen>
    with TickerProviderStateMixin {
  double sliderValue = 200;

  bool isBlueSelected = false;
  bool isGreenSelected = false;

  late AnimationController controllerCircle1;
  late AnimationController controllerCheck1;
  late AnimationController controllerCircle2;
  late AnimationController controllerCheck2;

  late Animation<double> _animationCircle1;
  late Animation<double> _animationCheck1;
  late Animation<double> _animationCircle2;
  late Animation<double> _animationCheck2;

  double waveRadius1 = 13.5;
  double checkLine1 = 6;
  double waveRadius2 = 13.5;
  double checkLine2 = 6;

  @override
  void initState() {
    super.initState();
    initControllers(sliderValue);
  }

  @override
  Widget build(BuildContext context) {
    _animationCircle1 = Tween(begin: 0.0, end: 13.5).animate(controllerCircle1)
      ..addListener(() {
        setState(() {
          waveRadius1 = _animationCircle1.value;
        });
      });

    _animationCheck1 = Tween(begin: 0.0, end: 6.0).animate(controllerCheck1)
      ..addListener(() {
        setState(() {
          checkLine1 = _animationCheck1.value;
        });
      });

    _animationCircle2 = Tween(begin: 0.0, end: 13.5).animate(controllerCircle2)
      ..addListener(() {
        setState(() {
          waveRadius2 = _animationCircle2.value;
        });
      });

    _animationCheck2 = Tween(begin: 0.0, end: 6.0).animate(controllerCheck2)
      ..addListener(() {
        setState(() {
          checkLine2 = _animationCheck2.value;
        });
      });

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isBlueSelected = true;
                      isGreenSelected = false;
                    });
                    if (isBlueSelected) {
                      controllerCircle1
                          .reverse()
                          .whenComplete(() => controllerCheck1.forward());
                      controllerCheck2
                          .reverse()
                          .whenComplete(() => controllerCircle2.forward());
                    }
                  },
                  child: CustomCheckBox(
                    checkLine1: checkLine1,
                    waveRadius1: waveRadius1,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isBlueSelected = false;
                      isGreenSelected = true;
                    });
                    if (isGreenSelected) {
                      controllerCircle2
                          .reverse()
                          .whenComplete(() => controllerCheck2.forward());
                      controllerCheck1
                          .reverse()
                          .whenComplete(() => controllerCircle1.forward());
                    }
                  },
                  child: CustomCheckBox(
                    checkLine1: checkLine2,
                    waveRadius1: waveRadius2,
                    color: Colors.green,
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('Animation duration'),
            Slider(
              value: sliderValue,
              onChanged: (newValue) {
                setState(() {
                  sliderValue = newValue;
                  initControllers(sliderValue);
                });
              },
              min: 200,
              max: 3000,
            ),
            Text(
              sliderValue.toInt().toString(),
            ),
          ],
        ),
      ),
    );
  }

  void initControllers(double duration) {
    controllerCircle1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration.toInt()));
    controllerCheck1 = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration.toInt()));
    controllerCircle2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration.toInt()));
    controllerCheck2 = AnimationController(
        vsync: this, duration: Duration(milliseconds: duration.toInt()));

    controllerCircle1.forward();
    controllerCheck1.forward().whenComplete(() => controllerCheck1.reverse());

    controllerCircle2.forward();
    controllerCheck2.forward().whenComplete(() => controllerCheck2.reverse());
  }
}

