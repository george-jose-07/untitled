import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:untitled/Contacts.dart';
import 'package:untitled/file.dart';
import 'package:email_validator/email_validator.dart';

class AddNumber extends StatefulWidget {
  AddNumber({Key? key})
      : super(key: key);
  @override
  State<AddNumber> createState() => _AddNumberState();
}

class _AddNumberState extends State<AddNumber> {
  TextEditingController controllerFirstname = TextEditingController();
  TextEditingController controllerSurname = TextEditingController();
  TextEditingController controllerPhone = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isEmail(String input) => EmailValidator.validate(input);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
            child: Text(
          'Create contact',
          style: TextStyle(color: Colors.white, fontSize: 20),
        )),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 50,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: <Color>[
                          Color.fromRGBO(150, 20, 200, 1),
                          Color.fromRGBO(250, 140, 240, 20),
                          Color.fromRGBO(200, 80, 200, 50),
                          Color.fromRGBO(200, 50, 200, 10)
                        ],
                        tileMode: TileMode.mirror,
                      ),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.add_a_photo_outlined,
                      color: Colors.white,
                      size: 50,
                    )),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Add photo',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: 70,
                  width: 300,
                  child: TextFormField(
                    controller: controllerFirstname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'First name',
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0.5),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter name';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: 70,
                  width: 300,
                  child: TextFormField(
                    controller: controllerSurname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Surname',
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0.5),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: 70,
                  width: 300,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controllerPhone,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Phone',
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0.5),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return 'Please enter phone number';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  height: 70,
                  width: 300,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: controllerEmail,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      labelText: 'Email',
                      labelStyle: const TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 0.5),
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return null;
                      }
                      if (!isEmail(val!)) {
                        return "enter valid email";
                      }
                    },
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                      Contacts addContacts = Contacts(
                          name: controllerFirstname.text,
                          number: controllerPhone.text,
                          email: controllerEmail.text,
                          surnumber: controllerSurname.text);
                      var box = await Hive.openBox<Contacts>('names');
                      box.add(addContacts);
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (BuildContext context) => ContactNames(),
                      ),
                      (route) => false,
                    );
                  }
                },
                child: Container(
                  height: 50,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        Color.fromRGBO(150, 20, 200, 1),
                        Color.fromRGBO(250, 140, 240, 20),
                        Color.fromRGBO(200, 80, 200, 50),
                        Color.fromRGBO(200, 50, 200, 10)
                      ],
                      tileMode: TileMode.mirror,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'SAVE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
