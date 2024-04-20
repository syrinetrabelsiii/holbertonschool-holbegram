import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool passwordVisible;

  LoginScreen({
    required this.emailController,
    required this.passwordController,
    this.passwordVisible = true,
  });

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void dispose() {
    widget.emailController.dispose();
    widget.passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 28),
            Text(
              "Holbegram",
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 50,
              ),
            ),
            SizedBox(height: 28),
            Image.asset(
              'assets/images/logo.png',
              width: 80,
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 28),
                  TextFieldInput(
                    controller: widget.emailController,
                    isPassword: false,
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 24),
                  TextFieldInput(
                    controller: widget.passwordController,
                    isPassword: !widget.passwordVisible,
                    hintText: 'Password',
                    keyboardType: TextInputType.visiblePassword,
                    suffixIcon: IconButton(
                      alignment: Alignment.bottomLeft,
                      onPressed: () {
                        setState(() {
                          widget.passwordVisible = !widget.passwordVisible;
                        });
                      },
                      icon: Icon(widget.passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  SizedBox(height: 28),
                  SizedBox(
                    height: 48,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(218, 226, 37, 24),
                        ),
                      ),
                      onPressed: () {
                        // Handle login button press
                      },
                      child: Text(
                        'Log in',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Forgot your login details?'),
                      Text(
                        'Get help logging in',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Flexible(flex: 0, child: Container()),
                  SizedBox(height: 24),
                  Divider(thickness: 2),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account'),
                        TextButton(
                          onPressed: () {
                            // Handle sign up button press
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(218, 226, 37, 24),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Flexible(child: Divider(thickness: 2)),
                      Text('OR'),
                      Flexible(child: Divider(thickness: 2)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'Image Link',
                        width: 40,
                        height: 40,
                      ),
                      Text('Sign in with Google'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final bool isPassword;
  final String hintText;
  final TextInputType keyboardType;
  final IconButton? suffixIcon;

  TextFieldInput({
    required this.controller,
    required this.isPassword,
    required this.hintText,
    required this.keyboardType,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
      ),
      keyboardType: keyboardType,
    );
  }
}
