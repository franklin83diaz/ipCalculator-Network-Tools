import 'package:flutter/material.dart';

import 'package:ip_calculator/util/cidr_util.dart';
import 'package:ip_calculator/util/expand_ip.dart';

class NetMask extends StatelessWidget {
  final String address;
  final Function(String cidr) onTap;

  const NetMask(this.address, {Key? key, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CIDR c = CIDR();
    final List<String> addressSplit = address.split("/");

    //if has CIDR
    if (addressSplit.length == 2 && addressSplit[1] != "") {
      return const SizedBox();
      //just ip
    } else if (addressSplit.length == 1) {
      String ip = addressSplit[0];
      return (expandip(ip) != "")
          ? DropdownButtonMask(onTap: onTap)
          : const SizedBox();
    }
    return const SizedBox();
  }
}

class DropdownButtonMask extends StatefulWidget {
  final Function onTap;
  const DropdownButtonMask({super.key, required this.onTap});

  @override
  State<DropdownButtonMask> createState() => _DropdownButtonMaskState();
}

class _DropdownButtonMaskState extends State<DropdownButtonMask> {
  final CIDR c = CIDR();
  late String mask;

  @override
  void initState() {
    super.initState();
    mask = "255.255.255.255";
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      icon: const Icon(Icons.arrow_downward, color: Colors.deepPurple),
      value: mask,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        widget.onTap(value);
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
