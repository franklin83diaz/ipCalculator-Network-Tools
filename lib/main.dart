import 'package:flutter/material.dart';
import 'package:ip_calculator/util/net_calc_util.dart';
import 'package:ip_calculator/util/validate_address_util.dart';
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
  String? cidr;

  NetCalc netCalc = NetCalc();
  Validate validate = Validate();

  @override
  Widget build(BuildContext context) {
    final n = netCalc.calc(address: address);
    return MaterialApp(
      title: 'IP Calculator',
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 205,
              color: const Color.fromARGB(255, 248, 248, 248),
              child: Column(
                children: [
                  IpInput(onTap: (bool v, String address, String? cidr) {
                    setState(() {
                      imputMaskshow = v;
                      this.address = address;
                      this.cidr = cidr;
                    });
                  }),
                  Align(
                    alignment: Alignment.topRight,
                    child: (imputMaskshow)
                        ? NetMask(address, onTap: (String cidr) {
                            setState(() {
                              this.cidr = cidr;
                            });
                          })
                        : const SizedBox(),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (validate.address(address) && n['netmask'] != null)
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: (cidr == null)
                              ? Text("Netmask: ${n['netmask']}")
                              : Text("Netmask: $cidr"),
                        )
                      : const SizedBox(),
                  (validate.address(address) && n['network'] != null)
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("Network: ${n['network']}"),
                        )
                      : const SizedBox(),
                  (validate.address(address) && n['broadcast'] != null)
                      ? Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text("Broadcast: ${n['broadcast']}"),
                        )
                      : const SizedBox(),
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
