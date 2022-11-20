import 'package:flutter/material.dart';

import 'package:ip_calculator/util/cidr_util.dart';
import 'package:ip_calculator/util/expand_ip.dart';

class NetMask extends StatelessWidget {
  final String address;

  const NetMask(this.address, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CIDR c = CIDR();
    final List<String> addressSplit = address.split("/");

    //if has CIDR
    if (addressSplit.length == 2 && addressSplit[1] != "") {
      return const Text(' ');
      //just ip
    } else if (addressSplit.length == 1) {
      String ip = addressSplit[0];
      return (expandip(ip) != "")
          ? const DropdownButtonMask()
          : const SizedBox();
    }
    return const Text(' ');
  }
}

class DropdownButtonMask extends StatefulWidget {
  const DropdownButtonMask({super.key});

  @override
  State<DropdownButtonMask> createState() => _DropdownButtonMaskState();
}

class _DropdownButtonMaskState extends State<DropdownButtonMask> {
  final CIDR c = CIDR();
  late String mask;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mask = "255.255.255.255";
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: const Icon(Icons.arrow_downward),
      value: mask,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          mask = value ?? "255.255.255.255";
        });
      },
      items: c.cirds.map<DropdownMenuItem<String>>((Map value) {
        return DropdownMenuItem<String>(
          value: value['mask'],
          child: Text("${value['mask']}  (/${value['cidr']})"),
        );
      }).toList(),
    );
  }
}
