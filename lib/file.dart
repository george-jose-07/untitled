import 'package:flutter/material.dart';
import 'package:untitled/AddContact.dart';
import 'package:hive/hive.dart';
import 'package:untitled/Contacts.dart';
import 'package:untitled/EditContacts.dart';

class ContactNames extends StatefulWidget {
  ContactNames({Key? key}) : super(key: key);

  @override
  State<ContactNames> createState() => _ContactNamesState();
}

class _ContactNamesState extends State<ContactNames> {
  static const String _HELLO = 'app';
  List<Contacts> listNames = [];

  getContacts() async {
    final box = await Hive.openBox<Contacts>('names');
    setState(() {
      listNames = box.values.toList();
    });
  }

  @override
  void initState() {
    getContacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.black,
          title: const Center(
            child: Text(
              'CONTACTS',
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNumber(),
              ));
        },
        child: Container(
            height: 60,
            width: 60,
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
            child: const Icon(Icons.add)),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemCount: listNames.length,
        itemBuilder: (context, index) {
          Contacts getContacts = listNames[index];
          return Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white, width: 0.5)),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    height: 50,
                    width: 50,
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
                    child: const Center(child: Icon(Icons.person)),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Container(
                    width: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          getContacts.name,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          getContacts.number,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: 250,
                              width: MediaQuery.of(context).size.width,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: <Color>[
                                      Color.fromRGBO(70, 70, 70, 20),
                                      Color.fromRGBO(140, 140, 140, 20),
                                      Color.fromRGBO(180, 180, 180, 20),
                                      Color.fromRGBO(140, 140, 140, 20),
                                      Color.fromRGBO(70, 70, 70, 20)
                                    ],
                                    tileMode: TileMode.mirror,
                                    stops: [0.1, 0.3, 0.5, 0.7, 0.9]),
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () => Navigator.pop(context),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: const [
                                                SizedBox(width: 10),
                                                Text('CLOSE',
                                                    style: TextStyle(
                                                        color: Colors.white)),
                                                Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Edit_Contacts(
                                                                  isEdit: true,
                                                                  pos: index,
                                                                  contactModel:
                                                                      getContacts)));
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Text(
                                                        'EDIT',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Icon(
                                                        Icons.edit,
                                                        size: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 20,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  final box =
                                                      Hive.box<Contacts>(
                                                          'names');
                                                  box.deleteAt(index);
                                                  setState(() => {
                                                        listNames
                                                            .removeAt(index)
                                                      });
                                                },
                                                child: Container(
                                                  height: 30,
                                                  width: 150,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Colors.white)),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: const [
                                                      Text(
                                                        'DELETE',
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        width: 5,
                                                      ),
                                                      Icon(
                                                        Icons.delete,
                                                        size: 20,
                                                        color: Colors.white,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      const Text(
                                        'NAME :',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        getContacts.name +
                                            ' ' +
                                            getContacts.surnumber,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      const Text(
                                        'PHONE NUMBER :',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        getContacts.number,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      const Text(
                                        'EMAIL :',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        getContacts.email.isEmpty
                                            ? 'null'
                                            : getContacts.email,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        color: Colors.white,
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
