import 'package:flutter/material.dart';
import 'package:foodapp/styles/generalStyle.dart';
import 'package:foodapp/styles/myforms.dart';
import 'package:foodapp/views/loginpage.dart';

class SignPage extends StatefulWidget {
  SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  bool signinPage = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    getValues() {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        currentFocus.focusedChild!.unfocus();
      }
      if (_formKey.currentState!.validate()) {
        print(name.text);
        print(
            '${email.text} , ${password.text} , ${confirmPassword.text},${phone.text}');
      }
    }

    clearInputs() {
      email.text = '';
      password.text = '';
      confirmPassword.text = '';
      phone.text = '';
      name.text = '';
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Spacer(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              color: green,
              alignment: Alignment.center,
              child: Text(
                !signinPage ? 'Welcome' : 'Register',
                style: TextStyle(
                    color: white, fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: !signinPage
                          ? [1, 3]
                              .map((i) => Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomForm(
                                        name: controllers[i],
                                        labeltext: inputLabels[i],
                                        icon: icons[i],
                                      ),
                                    ],
                                  ))
                              .toList()
                          : [0, 1, 2, 3, 4]
                              .map((i) => Column(
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomForm(
                                        name: controllers[i],
                                        labeltext: inputLabels[i],
                                        icon: icons[i],
                                      ),
                                    ],
                                  ))
                              .toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MaterialButton(
                      onPressed: () {
                        getValues();
                      },
                      minWidth: 200,
                      height: 40,
                      color: green,
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: white, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => LoginPage()),
                        // );
                        setState(() {
                          clearInputs();
                          signinPage = !signinPage;
                        });
                      },
                      child: Text(
                        !signinPage
                            ? "i am a new user"
                            : 'Already have an account',
                        style: TextStyle(
                          color: green,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    ));
  }
}
