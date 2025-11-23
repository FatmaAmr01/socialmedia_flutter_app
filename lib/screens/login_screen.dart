import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialmedia/providers/auth_provider.dart';
import 'package:socialmedia/screens/post_screen.dart';
import 'package:socialmedia/screens/signup_screen.dart';
import 'package:socialmedia/widgets/custom_form_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var myProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Text('Login Screen'),
        centerTitle: true,
      ),

      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: emailController,
              icon: Icons.email,
              labelText: "Email",
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains("@")) {
                  return 'Please enter a valid email address';
                }
                return null;

              },
            ),

            SizedBox(height: 30),
            CustomTextField(
              controller: passwordController,
              icon: Icons.lock,
              labelText: "Password",
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                if (value.length < 5) {
                  return 'Password must be at least 6 characters long';
                }
                return null;
              },
            ),

            SizedBox(height: 50),

            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await myProvider.login(
                    email: emailController.text,
                    password: passwordController.text,
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text(myProvider.user?.message ?? ""),
                    ),
                  );
                  if (myProvider.user?.status == true) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PostScreen()),
                    );
                  }
                }
              },
              child: Text("Login"),
            ),

             TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Text("Don't have an account? Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}
