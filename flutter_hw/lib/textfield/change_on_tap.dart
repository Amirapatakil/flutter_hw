import 'package:flutter/material.dart';

class ColorChangeWidget extends StatefulWidget {
  @override
  _ColorChangeWidgetSt createState() => _ColorChangeWidgetSt();
}

class _ColorChangeWidgetSt extends State<ColorChangeWidget> {
  Color mainContainer = Colors.blue;
  void _changeColor(Color color) {
    setState(() {
      mainContainer = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 200,
          color: mainContainer,
          child: const Center(child: Text('Поменяй цвет квадрата')),
        ),
        const SizedBox(
            height: 20), // расстояние между главным контейнером и маленьких
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => _changeColor(Colors.red),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () => _changeColor(Colors.green),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
            ),
            const SizedBox(width: 10),
            InkWell(
              onTap: () => _changeColor(Colors.yellow),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
