class CIDR {
  List<Map> cirds = [
    {
      'cidr': 0,
      'netwoks': {'A': '256'},
      'hosts': 4294967296,
      'mask': '0.0.0.0'
    },
    {
      'cidr': 1,
      'netwoks': {'A': '128'},
      'hosts': 2147483648,
      'mask': '128.0.0.0'
    },
    {
      'cidr': 2,
      'netwoks': {'A': '64'},
      'hosts': 1073741824,
      'mask': '192.0.0.0'
    },
    {
      'cidr': 3,
      'netwoks': {'A': '32'},
      'hosts': 536870912,
      'mask': '224.0.0.0'
    },
    {
      'cidr': 4,
      'netwoks': {'A': '16'},
      'hosts': 268435456,
      'mask': '240.0.0.0'
    },
    {
      'cidr': 5,
      'netwoks': {'A': '8'},
      'hosts': 67108864,
      'mask': '248.0.0.0'
    },
    {
      'cidr': 6,
      'netwoks': {'A': '4'},
      'hosts': 67108864,
      'mask': '252.0.0.0'
    },
    {
      'cidr': 7,
      'netwoks': {'A': '2'},
      'hosts': 33554432,
      'mask': '254.0.0.0'
    },
    {
      'cidr': 8,
      'netwoks': {'A': '1'},
      'hosts': 16777216,
      'mask': '255.0.0.0'
    },
    {
      'cidr': 9,
      'netwoks': {'B': '128'},
      'hosts': 8388608,
      'mask': '255.128.0.0'
    },
    {
      'cidr': 10,
      'netwoks': {'B': '64'},
      'hosts': 4194304,
      'mask': '255.192.0.0'
    },
    {
      'cidr': 11,
      'netwoks': {'B': '32'},
      'hosts': 2097152,
      'mask': '255.224.0.0'
    },
    {
      'cidr': 12,
      'netwoks': {'B': '16'},
      'hosts': 1048576,
      'mask': '255.240.0.0'
    },
    {
      'cidr': 13,
      'netwoks': {'B': '8'},
      'hosts': 524288,
      'mask': '255.248.0.0'
    },
    {
      'cidr': 14,
      'netwoks': {'B': '4'},
      'hosts': 262144,
      'mask': '255.252.0.0'
    },
    {
      'cidr': 15,
      'netwoks': {'B': '2'},
      'hosts': 131072,
      'mask': '255.254.0.0'
    },
    {
      'cidr': 16,
      'netwoks': {'B': '1'},
      'hosts': 65536,
      'mask': '255.255.0.0'
    },
    {
      'cidr': 17,
      'netwoks': {'C': '128'},
      'hosts': 32768,
      'mask': '255.255.128.0'
    },
    {
      'cidr': 18,
      'netwoks': {'C': '64'},
      'hosts': 16384,
      'mask': '255.255.192.0'
    },
    {
      'cidr': 19,
      'netwoks': {'C': '32'},
      'hosts': 8192,
      'mask': '255.255.224.0'
    },
    {
      'cidr': 20,
      'netwoks': {'C': '16'},
      'hosts': 4096,
      'mask': '255.255.240.0'
    },
    {
      'cidr': 21,
      'netwoks': {'C': '8'},
      'hosts': 2048,
      'mask': '255.255.248.0'
    },
    {
      'cidr': 22,
      'netwoks': {'C': '4'},
      'hosts': 1024,
      'mask': '255.255.252.0'
    },
    {
      'cidr': 23,
      'netwoks': {'C': '2'},
      'hosts': 512,
      'mask': '255.255.254.0'
    },
    {
      'cidr': 24,
      'netwoks': {'C': '1'},
      'hosts': 256,
      'mask': '255.255.255.0'
    },
    {
      'cidr': 25,
      'netwoks': {'C': '1/2'},
      'hosts': 128,
      'mask': '255.255.255.128'
    },
    {
      'cidr': 26,
      'netwoks': {'C': '1/4'},
      'hosts': 64,
      'mask': '255.255.255.192'
    },
    {
      'cidr': 27,
      'netwoks': {'C': '1/8'},
      'hosts': 32,
      'mask': '255.255.255.224'
    },
    {
      'cidr': 28,
      'netwoks': {'C': '1/16'},
      'hosts': 16,
      'mask': '255.255.255.240'
    },
    {
      'cidr': 29,
      'netwoks': {'C': '1/32'},
      'hosts': 8,
      'mask': '255.255.255.248'
    },
    {
      'cidr': 30,
      'netwoks': {'C': '1/64'},
      'hosts': 4,
      'mask': '255.255.255.252'
    },
    {
      'cidr': 31,
      'netwoks': {'C': '1/128'},
      'hosts': 2,
      'mask': '255.255.255.254'
    },
    {
      'cidr': 32,
      'netwoks': {'C': '1/256'},
      'hosts': 1,
      'mask': '255.255.255.255'
    },
  ];

  String GetMaskFromCIDR(int cidr) {
    if (cidr >= 0 && cidr <= 32) {
      Map infoCIDR = cirds.firstWhere((c) => c['cidr'] == cidr);
      return infoCIDR['mask'];
    } else {
      return "Error";
    }
  }

  int GetHostsFromCIDR(int cidr) {
    if (cidr >= 0 && cidr <= 32) {
      Map infoCIDR = cirds.firstWhere((c) => c['cidr'] == cidr);
      return infoCIDR['hosts'];
    } else {
      return 0;
    }
  }
}
