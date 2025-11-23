import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialmedia/providers/auth_provider.dart';
import 'package:socialmedia/screens/login_screen.dart';
import 'package:socialmedia/widgets/custom_form_field.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController namController = TextEditingController();
  TextEditingController confpasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var myProvider = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Text('Signup Screen'),
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
              controller: namController,
              icon: Icons.person,
              labelText: "Name",
              obscureText: false,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
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

            SizedBox(height: 30),
            CustomTextField(
              controller: confpasswordController,
              icon: Icons.lock,
              labelText: "ConfirmPassword",
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please confirm your password';
                }
                if (value != passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),

            SizedBox(height: 50),

            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  await myProvider.signUp(
                    email: emailController.text,
                    password: passwordController.text,
                    confirmPassword: confpasswordController.text,
                    userName: namController.text,
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
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  }
                }
              },
              child: Text("Signup"),
            ),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text(" have an account? Login"),
            ),
          ],
        ),
      ),
    );
  }
}
