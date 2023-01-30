// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:movielab/Screens/home_screen.dart';
import 'package:movielab/Screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

String email = '';
String pass = '';
bool show=false;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(

        title: Text(
          'Login Page\t ',
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        // title: Container(
        //   margin: EdgeInsets.only(bottom: 60),
        //   child: const Text('Movie Lab',
        //     style: TextStyle(
        //
        //     ),
        //
        //   ),
        // ),

        toolbarHeight: 100,

        backgroundColor: const Color.fromARGB(255, 31, 28, 28),
        elevation: 0.0,
        // leading: Container(
        //   margin: EdgeInsets.only(bottom: 30),
        //
        //
        //    //  IconButton(
        //    //   icon: Icon(Icons.more_vert),
        //    //   onPressed: () {
        //    //     print('More button pressed');
        //    //   },
        //    // ),
        //
        // ),

        flexibleSpace: ClipPath(

          clipper: _CustomClipper(),
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(239, 230, 7, 7),
            // child: Center(
            //     // child: Text(
            //     //   'MOVIELAB\nLogin Page ',
            //     //   style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            //     //         color: Colors.white,
            //     //         fontWeight: FontWeight.bold,
            //     //       ),
            //     // ),
            //     ),
          ),
        ),

      ),

      body: LoadingOverlay(

        isLoading: show,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Account Email',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    fillColor:  const Color.fromARGB(239, 230, 7, 7),
                    filled: true,
                    hintText: "Please Enter Your Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                controller: _usernameController,
                onChanged: ((value) => email = value),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a Email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Account Password',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextFormField(
                style: const TextStyle(color: Colors.black),
                obscureText: true,
                decoration: InputDecoration(
                    fillColor:const Color.fromARGB(239, 230, 7, 7),
                    filled: true,
                    hintText: "Please Enter Your Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                controller: _passwordController,
                onChanged: ((value) => pass = value),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    show= true;
                  });
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: pass);
                    if (user != null || _formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  HomeScreen()),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                  setState(() {
                    show = false;
                  });

                  // if (_formKey.currentState!.validate()) {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => const HomeScreen()),
                  //   );
                  // }
                },
                child: const Text('Submit'),
              ),
              TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.blue.withOpacity(0.04);
                        }
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return Colors.blue.withOpacity(0.12);
                        }
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Forget the password')),
              TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                    overlayColor: MaterialStateProperty.resolveWith<Color?>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.hovered)) {
                          return Colors.blue.withOpacity(0.04);
                        }
                        if (states.contains(MaterialState.focused) ||
                            states.contains(MaterialState.pressed)) {
                          return Colors.blue.withOpacity(0.12);
                        }
                        return null; // Defer to the widget's default.
                      },
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyRegister()),
                    );
                  },
                  child: const Text('Create a new Account'))
            ],
          ),
        ),
      ),
    );
  }
}

class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 100);
    //in order to created curved line in the bottom
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    //implementing shouldReclip
    return true;
  }
}
