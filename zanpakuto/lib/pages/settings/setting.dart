import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zanpakuto/blocs/auth/auth_bloc.dart';

import '../../api/api.dart';
import '../../blocs/cubits/guest/guest_cubit.dart';
import '../signin/login_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<GuestCubit>();
    void _logout() async {
      await cubit.signOut();
      setState(() {});

      // var res = await CallApi().logout();
      // var body = jsonDecode(res.body);

      // print(body);
      // if (response == null) {
      //   SharedPreferences localStorage = await SharedPreferences.getInstance();
      //   localStorage.setString('token', "");
      //   localStorage.setString('user', "");
      // }
      // print(body);
    }

    return Scaffold(
      body: Center(
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (!state.isAuthenticated) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            }
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: _logout,
              child: Text("Logout",
                  style:
                      GoogleFonts.bebasNeue(fontSize: 20, color: Colors.white)),
              style: ButtonStyle(
                shape: MaterialStateProperty.resolveWith(
                  (state) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 25.0, horizontal: 60.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
