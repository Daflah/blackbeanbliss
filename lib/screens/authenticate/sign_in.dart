import 'package:blackbeanbliss/services/auth.dart';
import 'package:blackbeanbliss/shared/constants.dart';
import 'package:blackbeanbliss/shared/loading.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import Google Fonts

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
                // Background color
                Container(
                  color: Colors.brown[200], // Ganti warna latar belakang sesuai keinginan Anda
                  width: double.infinity,
                  height: double.infinity,
                ),
                SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 50.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        const SizedBox(height: 40.0),
                        Image.asset(
                          'images/logokita.png', // Ganti dengan path logo kamu
                          height: 120.0, // Membesarkan logo sedikit
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
                        const SizedBox(height: 40.0),
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
                                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                                obscureText: true,
                                validator: (val) =>
                                    val!.length < 8 ? 'Password must be at least 8 characters long' : null,
                                onChanged: (val) {
                                  setState(() => password = val);
                                },
                              ),
                              const SizedBox(height: 20.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.brown[400],
                                  minimumSize: Size(double.infinity, 50), // Memperbesar ukuran tombol
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
                                      // Setelah berhasil login, pindah ke halaman Home
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
                            ],
                          ),
                        ),
                        const SizedBox(height: 40.0), // Jarak tambahan sebelum teks "Not a member? Register now"
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Not a member? ',
                                style: GoogleFonts.dmSerifDisplay(
                                  fontSize: 16,
                                  color: Colors.white,
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
                ),
              ],
            ),
          );
  }
}
