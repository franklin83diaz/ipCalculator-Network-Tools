import 'package:flutter/material.dart';
import 'package:ip_calculator/widgets/ip_input_widget.dart';
import 'package:ip_calculator/widgets/net_input_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  //https://stackoverflow.com/questions/69755091/set-min-max-screen-size-in-flutter-windows

  // if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
  //   setWindowTitle('My App');
  //   setWindowMaxSize(const Size(max_width, max_height));
  //   setWindowMinSize(const Size(min_width, min_height));
  //}

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool imputMaskshow = false;
  String address = "0.0.0.0/0";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IP Calculator',
      home: Scaffold(
        body: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 248, 248, 248),
              child: Column(
                children: [
                  IpInput(onTap: (bool v, String address) {
                    setState(() {
                      imputMaskshow = v;
                      this.address = address;
                    });
                  }),
                  (imputMaskshow) ? NetMask(address) : const SizedBox(),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
