import 'package:ip_calculator/util/cidr_util.dart';
import 'package:ip_calculator/util/expand_ip.dart';

class NetCalc {
  CIDR c = CIDR();

  Map<String, String> calc({required String address}) {
    final List<String> addressSplit = address.split("/");
    final int cidr = (addressSplit.length == 2 && addressSplit[1] != "")
        ? int.tryParse(addressSplit[1]) ?? 32
        : 32;

    final ipsplit = expandip(addressSplit[0]).split(".");
    final int hosts = c.GetHostsFromCIDR(cidr);

    if (ipsplit.length != 4) return {};

    final int ipDecimal = (int.parse(ipsplit[0]) * 16777216) +
        (int.parse(ipsplit[1]) * 65536) +
        (int.parse(ipsplit[2]) * 256) +
        (int.parse(ipsplit[3]));

    final int levelSubnet = (ipDecimal / hosts).floor();

    int networkDecimal = levelSubnet * hosts;
    int broadcastDecimal = networkDecimal + hosts - 1;

    return {
      "network": DecimalToIp(networkDecimal),
      "broadcast": DecimalToIp(broadcastDecimal),
    };
  }
}

//Parse Decimal to IP
String DecimalToIp(int dIp) {
  int secIP1 = (dIp / 16777216).floor();
  dIp -= (secIP1 * 16777216);
  int secIP2 = (dIp / 65536).floor();
  dIp -= (secIP2 * 65536);
  int secIP3 = (dIp / 256).floor();
  dIp -= (secIP3 * 256);
  int secIP4 = dIp;
  return '$secIP1.$secIP2.$secIP3.$secIP4';
}
