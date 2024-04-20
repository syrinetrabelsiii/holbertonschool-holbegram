import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfirmController;
  bool passwordVisible;

  SignUp({
    required this.emailController,
    required this.usernameController,
    required this.passwordController,
    required this.passwordConfirmController,
    this.passwordVisible = true,
  });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void dispose() {
    widget.emailController.dispose();
    widget.usernameController.dispose();
    widget.passwordController.dispose();
    widget.passwordConfirmController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    widget.passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: widget.emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(height: 12),
              TextField(
                controller: widget.usernameController,
                decoration: InputDecoration(labelText: 'Username'),
              ),
              SizedBox(height: 12),
              TextField(
                controller: widget.passwordController,
                obscureText: !widget.passwordVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    icon: Icon(widget.passwordVisible
                        ? Icons.visibility
                        : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        widget.passwordVisible = !widget._passwordVisible;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 12),
              TextField(
                controller: widget.passwordConfirmController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Confirm Password'),
              ),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  // Implement sign up logic
                },
                child: Text('Sign Up'),
              ),
              SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Navigate back to Login screen
                },
                child: Text('Log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
