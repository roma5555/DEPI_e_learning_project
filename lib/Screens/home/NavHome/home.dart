import 'package:e_learning/Widgets/custom_drawer.dart';
import 'package:e_learning/Widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _drawerscaffoldkey =
      GlobalKey<ScaffoldState>();

  bool _isPressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            setState(() {
              _isPressed = !_isPressed;
            });
            if (_drawerscaffoldkey.currentState!.isDrawerOpen) {
              Navigator.pop(context);
            } else {
              _drawerscaffoldkey.currentState!.openDrawer();
            }
          },
          icon: _isPressed
              ? const Icon(
                  Icons.close,
                  size: 38,
                )
              : const Icon(
                  Icons.list_rounded,
                  size: 38,
                ),
          style: const ButtonStyle(
              overlayColor: WidgetStatePropertyAll(Colors.white)),
        ),
        title: Image.asset(
          'assets/images/logo2.jpg',
          fit: BoxFit.cover,
          height: 50,
        ),
      ),
      body: Scaffold(
        key: _drawerscaffoldkey,
        drawer: const Customdrawer(),
        body: Center(
          child: Column(
            children: [
              const Spacer(
                flex: 2,
              ),
              const Text(
                'LearnToCareer',
                style: TextStyle(
                    fontFamily: 'Oswald',
                    color: Color(0xFF3e48b2),
                    fontSize: 40),
              ),
              const Spacer(
                flex: 2,
              ),
              Customelevatedbutton(
                  text: 'Current module',
                  h: 50,
                  w: 300,
                  color: Colors.black,
                  OnPressed: () {
                    Navigator.pushNamed(context, 'CoursesHome');
                  },
                  fontSize: 24),
              const Spacer(
                flex: 1,
              ),
              Customelevatedbutton(
                  text: 'Upcoming meetings',
                  h: 50,
                  w: 300,
                  color: Colors.black,
                  OnPressed: () {},
                  fontSize: 24),
              const Spacer(
                flex: 1,
              ),
              Customelevatedbutton(
                  text: 'Explore job opportunities',
                  h: 50,
                  w: 300,
                  color: Colors.black,
                  OnPressed: () {
                    Navigator.pushNamed(context, 'JobsScreen');
                  },
                  fontSize: 21),
              const Spacer(
                flex: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }

}
