import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hrportalv2/authentication/authentication_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // If using Flutter BLoC

import 'package:provider/provider.dart';
import 'dashboard.dart';
import 'snackbar_widget.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late AuthenticationCubit authenticationCubit;
  final TextEditingController email =
      TextEditingController(text: 'dezain.tariq@gmail.com');
  final TextEditingController password =
      TextEditingController(text: '12345678');

  BuildContext? dialogueContext; // Declare dialogueContext variable
  @override
  void initState() {
    super.initState();
    iniCubit();
  }

  void iniCubit() {
    authenticationCubit = context.read<AuthenticationCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationLoading) {
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
                        CircularProgressIndicator(color: Color(0xFF30475E)),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text('Loading...')
                      ],
                    ),
                  ),
                );
              });
        } else if (state is AuthenticationSuccess) {
          Navigator.of(dialogueContext!).pop();

          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (builder) => dashboard()),
              (Route<dynamic> route) => false);
        } else if (state is AuthenticationUserNotFound) {
          final _snackBar = snackBar('User not found', Icons.done, Colors.red);
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);

          Navigator.of(dialogueContext!).pop();
        } else if (state is AuthenticationInternetError) {
          final _snackBar =
              snackBar('Internet connection failed', Icons.done, Colors.red);
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);

          Navigator.of(dialogueContext!).pop();
          print("internet error");
        } else if (state is AuthenticationFailed) {
          final _snackBar =
              snackBar('Something wrong happened', Icons.done, Colors.red);
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);

          print("failed");
        } else if (state is AuthenticationPasswordError) {
          final _snackBar =
              snackBar('Please invalid password', Icons.done, Colors.red);
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);

          Navigator.of(dialogueContext!).pop();
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 28,
                        color: Color(0xFF30475E),
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: email,
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
                      hintText: "Email",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xFF30475E)),
                    ),
                    obscureText: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: Color(0xFF30475E),
                      ),
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
                      hintText: "Password",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Color(0xFF30475E)),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () async {
                      await authenticationCubit.signInUser(
                          email.text.trim(), password.text.trim());
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
                          "Login",
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
      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
