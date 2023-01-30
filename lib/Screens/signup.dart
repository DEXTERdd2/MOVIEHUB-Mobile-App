import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:loading_overlay/loading_overlay.dart';

import 'home_screen.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

String email = '';
String pass = '';
bool show = false;

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyRegisterState createState() => _MyRegisterState();
}

@override
class _MyRegisterState extends State<MyRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/register.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          flexibleSpace: ClipPath(
            clipper: _CustomClipper(),
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 255, 17, 0),
              child: Center(
                child: Text(
                  'SIGN UP PAGE ',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: LoadingOverlay(
          isLoading: show,
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 35, top: 30),
                child: const Text(
                  'Create\nAccount',
                  style: TextStyle(color: Colors.white, fontSize: 33),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        child: Column(
                          children: [
                            TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Name",
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Email",
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onChanged: (value) => email=value,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            TextField(
                              style: const TextStyle(color: Colors.white),
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Colors.black,
                                    ),
                                  ),
                                  hintText: "Password",
                                  hintStyle:
                                      const TextStyle(color: Colors.white),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  )),
                              onChanged: (value) => pass=value,
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const Text(
                            //       'Sign Up',
                            //       style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 27,
                            //           fontWeight: FontWeight.w700),
                            //     ),
                            //     CircleAvatar(
                            //       radius: 30,
                            //       backgroundColor: const Color(0xff4c505b),
                            //       child: IconButton(
                            //           color: Colors.white,
                            //           onPressed: () {},
                            //           icon: const Icon(
                            //             Icons.arrow_forward,
                            //           )),
                            //     )
                            //   ],
                            // ),
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: TextButton(

                                    onPressed: () async {
                                      setState(() {
                                        show = true;
                                      });
                                      try {
                                        final user = await _auth
                                            .createUserWithEmailAndPassword(
                                                email: email, password: pass);
                                        if (user != null) {
                                          // ignore: use_build_context_synchronously
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                     HomeScreen()),
                                          );
                                        }
                                      } catch (e) {
                                        print(e);
                                      }
                                      setState(() {
                                        show = false;
                                      });

                                      // ignore: use_build_context_synchronously
                                      Navigator.pushNamed(context, 'login');
                                    },
                                    style: const ButtonStyle(

                                    ),
                                    child: const Text(
                                      'SIGN IN',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
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
    path.lineTo(0, height - 10);
    //in order to created curved line in the bottom
    path.quadraticBezierTo(width / 2, height, width, height - 10);
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
