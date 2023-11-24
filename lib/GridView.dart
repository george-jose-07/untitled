import 'package:flutter/material.dart';

class Gridview extends StatefulWidget {
  const Gridview({Key? key}) : super(key: key);

  @override
  State<Gridview> createState() => _GridviewState();
}

class _GridviewState extends State<Gridview> {
 /* int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
*/
  int up = 1;
  void increment() {
    setState(() {
      if (up >= 0) {
        up++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GridViewBuilder'),
        backgroundColor: Colors.red,
      ),
      body: GridView.builder(
        itemCount: up,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 0, mainAxisExtent: 100),
        itemBuilder: (BuildContext context, int index) {
          return index == up - 1
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(width: 0.5, color: Colors.black),
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                      onPressed: () {
                        increment();
                      },
                      icon: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5),
                        borderRadius: BorderRadius.circular(15)),
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                );
        },
      ),
    );
  }
}
