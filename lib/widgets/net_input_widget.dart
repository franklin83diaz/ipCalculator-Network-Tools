import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:ip_calculator/util/cidr_util.dart';

class NetMask extends StatelessWidget {
  final String address;

  const NetMask(this.address, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CIDR c = CIDR();
    List<String> addressSplit = address.split("/");

    if (addressSplit.length == 2 && addressSplit[1] != "") {
      String ip = addressSplit[0];
      int cIDR = int.parse(addressSplit[1]);
      String mask = c.GetMaskFromCIDR(cIDR);
      return Text('$ip $mask');
    } else if (addressSplit.length == 1) {
      String ip = addressSplit[0];
      return Text('$ip ');
    }
    return const Text(' ');
  }
}
