import 'package:flutter/material.dart';
import 'package:movielab/models/movie_model.dart';
import 'package:movielab/Widgets/movie_list_item.dart';
import 'package:movielab/Screens/movie_screen.dart';
import 'package:movielab/Screens/login_page.dart';
import 'package:movielab/Screens/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int selectedPage = 0;
    Icon customIcon = const Icon(Icons.search);
    Icon customIcon2 = const Icon(Icons.logout);

    List<Movie> movies = Movie.movies;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedPage,
          onTap: (int index) {
            setState(() {
              selectedPage = index;
            });
          },
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
                icon: Icon(Icons.home), label: ('Home')),
            const BottomNavigationBarItem(
                icon: Icon(Icons.work), label: ('Categories')),
            const BottomNavigationBarItem(
                icon: Icon(Icons.close), label: ('Exit'))
          ],
        ),
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.red,
                ),
                child: Text(
                  'MOVIEHUB',
                  style: TextStyle(fontSize: 50, fontStyle: FontStyle.italic),
                ),
              ),
              ListTile(
                title: const Text(
                  'LogOut',
                ),
                onTap: () {
                  _auth.signOut();
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('SignUp Page'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyRegister()),
                  );
                  // ...
                },

              ),
              ListTile(
                title: const Text('Categories'),
                onTap: () {

                },

              ),
              ListTile(
                title: const Text('Settings'),
                onTap: () {

                },

              ),
              ListTile(
                title: const Text('Need Help?'),
                onTap: () {

                },

              ),
              ListTile(
                title: const Text('About Us'),
                onTap: () {


                  // ...
                },

              ),
            ],

          ),


        ),
        appBar: AppBar(
          backgroundColor: Colors.grey.shade400,
          toolbarHeight: 70,
          elevation: 14,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100))),
          title: const Center(
            child: Text(
              'MOVIELAB',
            ),
          ),
          actions: [
            Row(
              children: [
                Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 7,
                              spreadRadius: 3,
                              color: Colors.transparent)
                        ],
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 36, 34, 35)),
                    child: IconButton(
                      onPressed: () {},
                      icon: customIcon,
                    )),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  decoration: BoxDecoration(boxShadow: [
                    const BoxShadow(
                        blurRadius: 7, spreadRadius: 3, color: Colors.pink)
                  ], shape: BoxShape.circle, color: Colors.pink.shade400),
                  child: const Icon(
                    Icons.notifications,
                    size: 20,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    decoration: BoxDecoration(boxShadow: [
                      const BoxShadow(
                          blurRadius: 7, spreadRadius: 3, color: Colors.pink)
                    ], shape: BoxShape.circle, color: Colors.pink.shade400),

                    //logout button
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginPage()),
                        );
                      },
                      icon: customIcon2,
                    )),
                const SizedBox(
                  width: 26,
                )
              ],
            )
          ],
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 150,
            ),
            child: Column(
              children: [
                RichText(
                  text: TextSpan(
                      style: Theme.of(context).textTheme.headline6,
                      children: [
                        TextSpan(
                          text: 'Featured',
                          style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                        ),
                        const TextSpan(
                            text: 'MOVIES',
                            style: TextStyle(color: Colors.white)),
                      ]),
                ),
                const SizedBox(height: 20),
                for (final movie in movies)
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MovieScreen(movie: movie),
                          ));
                    },
                    child: MovieListItem(
                        imageUrl: movie.imagePath,
                        name: movie.name,
                        information:
                            '${movie.year} | ${movie.category} | ${movie.category} | ${movie.category} | ${movie.duration.inHours}h ${movie.duration.inMinutes.remainder(60)}m'),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void setState(Null Function() param0) {}
}

//creating custom clipper (allows us to make differnt shapes)
class _CustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var path = Path();
    path.lineTo(0, height - 50);
    //in order to created curved line in the bottom
    path.quadraticBezierTo(width / 2, height, width, height - 50);
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
