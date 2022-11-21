import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ip_calculator/util/validate_address_util.dart';

class IpInput extends StatefulWidget {
  final Function onTap;
  const IpInput({Key? key, required this.onTap}) : super(key: key);

  @override
  State<IpInput> createState() => _IpInputState();
}

class _IpInputState extends State<IpInput> {
  final TextEditingController ipImput = TextEditingController();

  Validate validate = Validate();

  bool errorIp = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8),
      child: SizedBox(
        width: 205,
        child: TextField(
          style: const TextStyle(
              color: Color.fromARGB(255, 143, 175, 241),
              fontSize: 20,
              height: 1),
          controller: ipImput,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9./]'))
          ],
          onChanged: (value) {
            if (validate.address(value)) {
              setState(() {
                errorIp = false;
                widget.onTap(true, ipImput.text, null);
              });
            } else {
              setState(() {
                errorIp = true;
                widget.onTap(false, ipImput.text, null);
              });
            }
          },
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
            border: const OutlineInputBorder(),
            errorText: errorIp ? "ip format error!" : null,
            hintText: "0.0.0.0/32",
            prefixIconColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
