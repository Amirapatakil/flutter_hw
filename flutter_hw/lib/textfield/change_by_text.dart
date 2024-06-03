import 'package:flutter/material.dart';

class ColorChangeByText extends StatefulWidget {
  const ColorChangeByText({super.key});

  @override
  State<ColorChangeByText> createState() => _ColorChangeByTextState();
}

class _ColorChangeByTextState extends State<ColorChangeByText> {
  Color mainContainerColor = Colors.pink;
  final TextEditingController _colorController = TextEditingController();

  void _changeColor(String color) {
    Color? newColor = _getColorFromString(color);
    if (newColor != null) {
      setState(() {
        mainContainerColor = newColor;
      });
    }
  }

  Color? _getColorFromString(String color) {
    switch (color.toLowerCase()) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      case 'yellow':
        return Colors.yellow;
      case 'orange':
        return Colors.orange;
      case 'purple':
        return Colors.purple;
      case 'pink':
        return Colors.pink;
      case 'black':
        return Colors.black;
      case 'white':
        return Colors.white;
      case 'grey':
        return Colors.grey;
      default:
        return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 200,
            width: 200,
            color: mainContainerColor,
            child: const Center(
              child: Text('Измени цвет квадрата'),
            )),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: TextField(
            controller: _colorController,
            decoration: const InputDecoration(
              labelText: 'Введите цвет',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () => _changeColor(_colorController.text),
          child: const Text('Change Color'),
        ),
      ],
    );
  }
}
