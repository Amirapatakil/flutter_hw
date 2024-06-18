import 'package:flutter/material.dart';
import 'package:flutter_hw/verstka/widgets/app_scaffold.dart';
import 'package:flutter_hw/verstka/screens/second_page.dart';

class FourPage extends StatefulWidget {
  const FourPage({super.key});

  @override
  State<FourPage> createState() => _FourPageState();
}

class _FourPageState extends State<FourPage> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isBackButtonVisible: true,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SecondPage()));
      },
      child: const Center(
        child: Text('Welcome to Fourth Page!'),
      ),
    );
  }
}
