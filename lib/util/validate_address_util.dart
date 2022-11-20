class Validate {
  final RegExp ipRegex = RegExp('25[0-5]|2[0-4][0-9]|[0-1][0-9][0-9]|00[0-9]');

  bool address(ipImput) {
    //separate ip and mask
    final List<String> inputSplit = ipImput.split("/");

    //set IP
    final String ip = inputSplit.first;

    //set Mask
    final int? mask =
        (inputSplit.length == 2) ? int.tryParse(inputSplit.last) : null;

    //Error by bad mask number less 0 or more 32
    if (mask != null && (mask > 32 || mask < 0)) {
      return false;
    }

    //Error format: more of one "/"
    if (inputSplit.length > 2) {
      return false;
    }
    //Error format:  "..""
    if (ip.contains("..")) {
      return false;
    }
    //Error format:  more of 4 number
    if (ip.split(".").length > 4) {
      return false;
    }
    //avoid error writing ip
    final ipSplit = ip.split(".");
    ipSplit.remove("");

    for (String sm in ipSplit) {
      //error more of digit for numer
      if (sm.length > 3) {
        return false;
      }
      if (!ipRegex.hasMatch(sm.padLeft(3, '0'))) {
        return false;
      }
    }
    return true;
  }
}
