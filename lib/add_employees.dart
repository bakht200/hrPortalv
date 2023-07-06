import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddEmployees extends StatefulWidget {
  const AddEmployees({super.key});

  @override
  State<AddEmployees> createState() => _AddEmployeesState();
}

class _AddEmployeesState extends State<AddEmployees> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _fatherController = TextEditingController();
  TextEditingController _cnicController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  BuildContext? dialogueContext; // Declare dialogueContext variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Employee'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Add Employee Information",
                  style: TextStyle(
                      fontSize: 28,
                      color: Color(0xFF30475E),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF30475E),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 1,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF30475E))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF30475E))),
                    hintText: "Enter your name",
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xFF30475E)),
                  ),
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color(0xFF30475E),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 1,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF30475E))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF30475E))),
                    hintText: "Enter your email",
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xFF30475E)),
                  ),
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _fatherController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.person,
                      color: Color(0xFF30475E),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 1,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF30475E))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF30475E))),
                    hintText: "Enter you father name",
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xFF30475E)),
                  ),
                  obscureText: false,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF30475E),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 1,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF30475E))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF30475E))),
                    hintText: "Enter password",
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xFF30475E)),
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _cnicController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.numbers,
                      color: Color(0xFF30475E),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      borderSide:
                          BorderSide(width: 1, color: Color(0xFF30475E)),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide: BorderSide(
                          width: 1,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF30475E))),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(width: 1, color: Color(0xFF30475E))),
                    hintText: "Enter Cnic",
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xFF30475E)),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () async {
                    showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (_ctx) {
                          dialogueContext = _ctx;
                          return Dialog(
                            backgroundColor: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CircularProgressIndicator(
                                      color: Color(0xFF30475E)),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  const Text('Loading...')
                                ],
                              ),
                            ),
                          );
                        });
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                              email: _emailController.text.trim(),
                              password: _passwordController.text.trim());
                      Navigator.of(dialogueContext!).pop();
                      Navigator.of(context).pop();
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        Navigator.of(dialogueContext!).pop();
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        Navigator.of(dialogueContext!).pop();
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      Navigator.of(dialogueContext!).pop();
                      print(e);
                    }
                  },
                  child: Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xFF30475E),
                          border: Border.all(
                            color: Color(0xFF30475E),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: Center(
                          child: Text(
                        "Submit",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
