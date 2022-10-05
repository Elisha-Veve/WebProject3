import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:zanpakuto/api/api.dart';
import 'package:zanpakuto/blocs/cubits/guest/guest_cubit.dart';
import 'package:zanpakuto/models/requests/login_request.dart';
import 'package:zanpakuto/pages/Loading/loading_page.dart';
import 'package:zanpakuto/pages/home/homepage.dart';

import '../../signup/signup_screen.dart';

class LoginForm extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  const LoginForm(
      {Key? key,
      required this.emailController,
      required this.passwordController})
      : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final double borderRadius = 20;
  final _formkey = GlobalKey<FormState>();
  bool _isLoading = false;

  Widget _buildEmailField() {
    return TextFormField(
      controller: widget.emailController,
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.email),
          labelText: 'Email',
          labelStyle: GoogleFonts.bebasNeue(
            fontSize: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              width: 0,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
          )),
      style: GoogleFonts.openSans(
        fontSize: 16,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: widget.passwordController,
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          suffixIcon: Icon(Icons.password),
          labelText: 'Password',
          labelStyle: GoogleFonts.bebasNeue(
            fontSize: 16,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              width: 0,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            borderSide: BorderSide(
              width: 1,
              color: Theme.of(context).colorScheme.primary,
            ),
          )),
      style: GoogleFonts.openSans(
        fontSize: 16,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GuestCubit>();
    @override
    void initState() {
      super.initState();
    }

    Future<void> openDialog(BuildContext context, String message) async {
      return showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Error'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    void _submitForm() async {
      if (_formkey.currentState!.validate()) {
        _formkey.currentState!.save();
        setState(() {
          _isLoading = true;
        });
        print('Form is valid');
      } else {
        print('Form is invalid');
      }
      var data = LoginRequest(
          email: widget.emailController.text,
          password: widget.passwordController.text);
      var response = await cubit.signIn(data);
      // var res = await CallApi().postData(data, 'auth/login');
      // var body = json.decode(res.body);

      // print(body);
      setState(() {
        _isLoading = false;
      });
      if (response == null) {
        // var data = body['data'];
        // var user = body['data']['user'];
        // var token = body['data']['token'];
        // SharedPreferences localStorage = await SharedPreferences.getInstance();
        // localStorage.setString('token', token);
        // localStorage.setString('user', jsonEncode(user));
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      } else {
        openDialog(context, response);
      }
      // print(body);
    }

    return _isLoading
        ? LoadingPage()
        : Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Sign in",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 40,
                      color: Theme.of(context).colorScheme.secondary,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: TextStyle(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' Sign up!',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen()));
                            }),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                _buildEmailField(),
                const SizedBox(height: 20),
                _buildPasswordField(),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text("Sign In"),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.resolveWith(
                      (state) => RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadius)),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 60.0),
                    ),
                  ),
                ),
              ],
            ));
  }
}
