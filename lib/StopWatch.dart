import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StopWatch extends StatefulWidget {
  const StopWatch({Key? key}) : super(key: key);


  @override
  State<StopWatch> createState() => _StopWatchState();
}

class _StopWatchState extends State<StopWatch> {
  int? _selectedIndex = 0;
  Map<int, Widget> children = <int, Widget>{
    0: const Text(
      'LIGHT',
      style:
          TextStyle(color: CupertinoColors.white, fontWeight: FontWeight.w700),
    ),
    1: const Text(
      'DARK',
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
    )
  };
  List<Color> col1 = [Colors.white, Colors.grey];
  List<Color> col = [Colors.grey, Colors.black];
  Color color1 = Colors.black;
  Color color2 = Colors.white;
  bool switchval = false;
  String millisec = '00';
  String sec = '00';
  String min = '00';
  String hour = '00';
  Stopwatch stpwtch = Stopwatch();
  late Timer timer;
  void strt() {
    stpwtch.start();
    timer = Timer.periodic(const Duration(milliseconds: 1), upd);
  }

  void upd(Timer) {
    if (stpwtch.isRunning) {
      setState(() {
        hour = (stpwtch.elapsed.inHours).toString();
        min = (stpwtch.elapsed.inMinutes % 60).toString();
        sec = (stpwtch.elapsed.inSeconds % 60).toString();
        millisec = (stpwtch.elapsed.inMilliseconds % 100).toString();
      });
    }
  }

  void stop() {
    setState(() {
      timer.cancel();
      stpwtch.stop();
    });
  }

  void rset() {
    timer.cancel();
    stpwtch.reset();
    setState(() {
      millisec = '00';
      sec = '00';
      min = '00';
      hour = '00';
    });
    stpwtch.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text(
          'CALCULATOR',
          style:
              TextStyle(color: _selectedIndex == 1 ? Colors.blue : Colors.red),
        ),
        backgroundColor: _selectedIndex == 1
            ? CupertinoColors.darkBackgroundGray
            : CupertinoColors.white,
      ),
      backgroundColor: _selectedIndex == 1 ? color1 : color2,
      body: SingleChildScrollView(
          child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CupertinoSlidingSegmentedControl<int>(
            padding: const EdgeInsets.all(5),
            thumbColor: _selectedIndex == 1 ? Colors.blue : Colors.red,
            backgroundColor: _selectedIndex == 1
                ? Colors.grey.shade900
                : Colors.grey.shade300,
            children: children,
            onValueChanged: (int? value) {
              setState(() {
                _selectedIndex = value;
              });
            },
            groupValue: _selectedIndex,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(
                  height: 70,
                ),
                Container(
                  height: 260,
                  width: 260,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          colors: _selectedIndex == 1 ? col : col1,
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      color: _selectedIndex == 1 ? color1 : color2,
                      border: Border.all(
                          width: 2,
                          color:
                              _selectedIndex == 1 ? Colors.blue : Colors.red),
                      boxShadow: [
                        BoxShadow(
                            color: _selectedIndex == 1
                                ? Colors.blue
                                : Colors.red,
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(-5,5))
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Center(
                              child: Text(
                            hour,
                            style: TextStyle(
                                color:  _selectedIndex == 1 ? Colors.blue : Colors.red,
                                fontSize: 35),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Center(
                              child: Text(
                            min,
                            style: TextStyle(
                                color:  _selectedIndex == 1 ? Colors.blue : Colors.red,
                                fontSize: 35),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Center(
                              child: Text(
                            sec,
                            style: TextStyle(
                                color:  _selectedIndex == 1 ? Colors.blue : Colors.red,
                                fontSize: 35),
                          )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 40,
                          width: 40,
                          child: Center(
                              child: Text(
                            millisec,
                            style: TextStyle(
                                color:  _selectedIndex == 1 ? Colors.blue : Colors.red,
                                fontSize: 35),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 100),
                CupertinoSwitch(
                  value: switchval,
                  activeColor: _selectedIndex == 1
                      ? CupertinoColors.activeBlue
                      : CupertinoColors.destructiveRed,
                  onChanged: (bool? value) {
                    setState(() {
                      switchval = value ?? false;
                      stpwtch.isRunning ? stop() : strt();
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  width: 250,
                  child: CupertinoButton(
                    disabledColor: _selectedIndex == 1
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.destructiveRed,
                    onPressed: () {
                      rset();
                    },
                    child: Text(
                      "RESET",
                      style: TextStyle(
                          color: _selectedIndex == 1
                              ? CupertinoColors.activeBlue
                              : CupertinoColors.destructiveRed,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
