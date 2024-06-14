import 'package:blackbeanbliss/services/auth.dart';
import 'package:blackbeanbliss/shared/constants.dart';
import 'package:blackbeanbliss/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key, required this.toggleView}) : super(key: key);

  final void Function() toggleView;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  String email = '';
  String password = '';
  String confirmPassword = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Loading()
        : Scaffold(
            backgroundColor: Colors.brown[200],
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'images/logokita.png', // Ganti dengan path logo kamu
                    height: 120.0, // Membesarkan logo sedikit
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    "Let's create an account for you!",
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: textInputDecoration.copyWith(hintText: 'Email'),
                            validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(hintText: 'Password'),
                            obscureText: true,
                            validator: (val) =>
                                val!.length < 8 ? 'Password must be at least 8 characters long' : null,
                            onChanged: (val) {
                              setState(() => password = val);
                            },
                          ),
                          const SizedBox(height: 20.0),
                          TextFormField(
                            decoration: textInputDecoration.copyWith(hintText: 'Confirm Password'),
                            obscureText: true,
                            validator: (val) {
                              if (val!.isEmpty) {
                                return 'Enter confirm password';
                              } else if (val != password) {
                                return 'Passwords do not match';
                              }
                              return null;
                            },
                            onChanged: (val) {
                              setState(() => confirmPassword = val);
                            },
                          ),
                          const SizedBox(height: 20.0),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.brown[400],
                              minimumSize: Size(double.infinity, 50),
                            ),
                            child: const Text(
                              'Register',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                setState(() => loading = true);
                                dynamic result =
                                    await _auth.registerWithEmailAndPassword(email, password);
                                if (result == null) {
                                  setState(() {
                                    error = 'Please supply a valid email';
                                    loading = false;
                                  });
                                } else {
                                  // After successful registration, navigate to Home page
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
                          const SizedBox(height: 12.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Already have an account? ',
                                style: TextStyle(color: Colors.black),
                              ),
                              GestureDetector(
                                onTap: widget.toggleView,
                                child: const Text(
                                  'Login now',
                                  style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
