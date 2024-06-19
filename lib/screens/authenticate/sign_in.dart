import 'dart:ui';

import 'package:blackbeanbliss/services/auth.dart';
import 'package:blackbeanbliss/shared/constants.dart';
import 'package:blackbeanbliss/shared/loading.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key, required this.toggleView}) : super(key: key);

  final void Function() toggleView;

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool _passwordVisible = false;

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            body: Stack(
              children: [
                // Solid background color
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.brown[700], // Replace with your preferred background color
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 25.0),
                        Image.asset(
                          'images/logocofferemovebg.png', // Replace with your logo path
                          height: 160.0,
                        ),
                        const SizedBox(height: 15.0),
                        Text(
                          'Welcome back you\'ve been missed!',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 70.0),
                        Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: textInputDecoration.copyWith(hintText: 'Email'),
                                validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                                onChanged: (val) {
                                  setState(() => email = val);
                                },
                              ),
                              const SizedBox(height: 20.0),
                              TextFormField(
                                decoration: textInputDecoration.copyWith(
                                  hintText: 'Password',
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _passwordVisible = !_passwordVisible;
                                      });
                                    },
                                  ),
                                ),
                                obscureText: !_passwordVisible,
                                validator: (val) => val!.length < 8 ? 'Password must be at least 8 characters long' : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                              ),
                              const SizedBox(height: 20.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.brown[400],
                                  minimumSize: Size(double.infinity, 50), // Button size
                                ),
                                child: const Text(
                                  'Sign In',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    setState(() => loading = true);
                                    dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                                    if (result == null) {
                                      setState(() {
                                        error = 'Could not sign in with those credentials';
                                        loading = false;
                                      });
                                    } else {
                                      // Navigate to Home after successful login
                                      Navigator.of(context).popUntil((route) => route.isFirst);
                                    }
                                  }
                                },
                              ),
                              const SizedBox(height: 12.0),
                              Text(
                                error,
                                style: const TextStyle(color: Colors.red, fontSize: 14.0),
                              ),
                              const SizedBox(height: 20.0),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Not a member? ',
                                      style: GoogleFonts.dmSerifDisplay(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Register now',
                                      style: const TextStyle(color: Colors.blue),
                                      recognizer: TapGestureRecognizer()..onTap = widget.toggleView,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 70.0), // Space between form and footer text
                        Text(
                          'Developed by Dev on Singh',
                          style: GoogleFonts.roboto(
                            fontSize: 12.0,
                            color: Colors.white54,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
