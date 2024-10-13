import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart'; // Import your LoginScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telkom Property',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoSizeAnimation;
  late Animation<Offset> _logoPositionAnimation;

  @override
  void initState() {
    super.initState();

    // Set up Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4), // Total duration of the splash screen
    );

    // Logo grows from small to full size in the center
    _logoSizeAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.0, 0.5, curve: Curves.easeInOut)),
    );

    // Logo moves upwards after it grows
    _logoPositionAnimation = Tween<Offset>(
      begin: Offset(0, 0), // Starts in the center
      end: Offset(0, -1), // Moves towards the top
    ).animate(
      CurvedAnimation(parent: _controller, curve: Interval(0.5, 1.0, curve: Curves.easeInOut)),
    );

    // Start the animation
    _controller.forward();

    // Navigate to login screen after 4 seconds
    _navigateToLogin();
  }

  _navigateToLogin() async {
    await Future.delayed(Duration(seconds: 4)); // Total splash duration
    Navigator.of(context).pushReplacement(_createRoute());
  }

  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween = Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: Curves.easeInOut));
        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
      transitionDuration: Duration(milliseconds: 500), // Transition duration
    );
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when not used
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: SlideTransition(
                position: _logoPositionAnimation,
                child: ScaleTransition(
                  scale: _logoSizeAnimation,
                  child: Image.asset(
                    'assets/images/logo.png', // Logo path
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0), // Bottom text
            child: Text(
              'Developed By Telkom University',
              style: GoogleFonts.poppins(fontSize: 16, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
