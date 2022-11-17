String expandip(String ip) {
  List ipSec = ip.split(".");
  if (ipSec.length == 1 && ipSec[0] != "") {
    return '0.0.0.${ipSec[0]}';
  }
  if (ipSec.length == 2) {
    if (ipSec[1] != "") {
      return '${ipSec[0]}.0.0.${ipSec[1]}';
    } else {
      return '';
    }
  }
  if (ipSec.length == 3) {
    if (ipSec[2] != "") {
      return '${ipSec[0]}.${ipSec[1]}.0.${ipSec[2]}';
    } else {
      return "";
    }
  }
  if (ipSec.length == 4 && ipSec[3] == "") {
    return "";
  }

  return ip;
}
