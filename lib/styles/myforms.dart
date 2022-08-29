import 'package:flutter/material.dart';
import 'package:foodapp/styles/generalStyle.dart';

// text editing controllers
TextEditingController name = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController confirmPassword = TextEditingController();
TextEditingController phone = TextEditingController();

List<TextEditingController> controllers = [
  name,
  email,
  phone,
  password,
  confirmPassword
];

List<String> inputLabels = [
  'Name',
  "Email",
  "Phone Number",
  "Password",
  "Confirm Password"
];
List<IconData> icons = [
  Icons.person,
  Icons.mail,
  Icons.phone,
  Icons.vpn_key,
  Icons.vpn_key
];

class CustomForm extends StatelessWidget {
  const CustomForm(
      {Key? key,
      required this.name,
      required this.icon,
      required this.labeltext})
      : super(key: key);

  final TextEditingController name;
  final IconData icon;
  final String labeltext;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: name,
        obscureText:
            (labeltext == 'Password' || labeltext == 'Confirm Password')
                ? true
                : false,
        maxLines: 1,
        keyboardType: labeltext == 'Email'
            ? TextInputType.emailAddress
            : labeltext == "Phone Number"
                ? TextInputType.phone
                : TextInputType.text,
        cursorColor: Colors.black,
        minLines: null,
        validator: (value) {
          if (value == '') {
            return ('Please fill in $labeltext ');
          }

          if (labeltext == 'Password' || labeltext == 'Confirm Password') {
            if (value!.length < 6) {
              return ('$labeltext is too short');
            }
            if (value != password.text) {
              return ('Password does not match');
            }
          }
        },
        decoration: InputDecoration(
            label: Text(
              labeltext,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            floatingLabelStyle: TextStyle(color: green),
            prefixIcon: Icon(
              icon,
              color: green,
            ),
            prefixIconColor: green,
            focusedBorder: const OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            fillColor: Colors.red));
  }
}

// searchform
class SearchForm extends StatelessWidget {
  const SearchForm({
    Key? key,
    required this.search,
  }) : super(key: key);

  final TextEditingController search;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: search,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.black,
        ),
        filled: true,
        fillColor: arsenic,
        prefixIconColor: Colors.black,
        hintText: 'Search for something tasty',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: arsenic),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: arsenic),
        ),
      ),
    );
  }
}
