import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/ListView.dart';
import 'package:email_validator/email_validator.dart';
import 'package:untitled/ListViewBuilder.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  bool _isVisible = false;
  bool _validate = false;
  final _formKey = GlobalKey<FormState>();
  bool isEmail(String input) => EmailValidator.validate(input);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            color: const Color.fromRGBO(110, 110, 110, 100),
                            width: 2.5)),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Center(
                      child: Text(
                    "Log in",
                    style: GoogleFonts.anton(
                        color: Colors.white, fontSize: 30, letterSpacing: 2),
                  ))
                ],
              ),
              Container(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Login with one of the following options.',
                    style: TextStyle(color: Colors.white54, fontSize: 15),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 40, left: 15, top: 20, right: 8),
                    child: Container(
                        height: 60,
                        width: MediaQuery.of(context).size.width / 2.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.5),
                          border: Border.all(
                              color: const Color.fromRGBO(110, 110, 110, 100)),
                          color: const Color.fromRGBO(50, 50, 50, 80),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(17),
                          child: Image.network(
                              'https://www.seekpng.com/png/full/788-7887426_google-g-png-google-logo-white-png.png',
                              width: 2,
                              height: 2,
                              fit: BoxFit.scaleDown),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 40, left: 8, top: 20, right: 15),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 2.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.5),
                        border: Border.all(
                            color: const Color.fromRGBO(110, 110, 110, 100)),
                        color: const Color.fromRGBO(50, 50, 50, 80),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.apple,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(
                        color: Color.fromRGBO(220, 220, 220, 30), fontSize: 15),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 8, bottom: 30),
                child: Container(
                  height: 70,
                  child: TextFormField(
                    controller: nameTextController,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.5),
                      ),
                      hintText: "Enter Your Email",
                      hintStyle: const TextStyle(color: Colors.white54),
                      fillColor: const Color.fromRGBO(50, 50, 50, 80),
                      filled: true,
                      contentPadding: const EdgeInsets.only(
                          top: 10, right: 10, left: 10, bottom: 10),
                      suffixIcon: const Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 20,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(110, 110, 110, 100)),
                          borderRadius: BorderRadius.circular(16.5)),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'please enter Email';
                      }
                      if (!isEmail(val)) {
                        return "enter valid email";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(
                        color: Color.fromRGBO(220, 220, 220, 30), fontSize: 15),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 8, bottom: 20),
                child: Container(
                  height: 70,
                  child: TextFormField(
                    controller: passwordTextController,
                    obscureText: !_isVisible,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16.5),
                      ),
                      hintText: 'Enter Your Password',
                      hintStyle: const TextStyle(color: Colors.white54),
                      fillColor: const Color.fromRGBO(50, 50, 50, 80),
                      filled: true,
                      contentPadding: const EdgeInsets.only(
                          top: 10, right: 10, left: 10, bottom: 10),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isVisible ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isVisible = !_isVisible;
                          });
                        },
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromRGBO(110, 110, 110, 100)),
                          borderRadius: BorderRadius.circular(16.5)
                      ),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'please enter Password';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15, right: 15, top: 8, bottom: 4),
                child: Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Color.fromRGBO(150, 20, 200, 1),
                          Color.fromRGBO(250, 140, 240, 20),
                        ],
                        tileMode: TileMode.mirror,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: TextButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ListViewPage(
                              name: nameTextController.text,
                              password: passwordTextController.text,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont have an account?",
                      style: TextStyle(color: Colors.white54)),
                  TextButton(
                    onPressed: () {

                    },
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
