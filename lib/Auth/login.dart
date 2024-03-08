import 'package:currencyexchange1/Widget/custom_textfield.dart';
import 'package:flutter/material.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login',style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 30
              ),),
              SizedBox(height: 30,),
              CustomTextField(controller: emailController,
                  label: "Email", icon: Icons.email_outlined, isHide: false, hintText: "Enter your email"),
              SizedBox(height: 30,),
              CustomTextField(controller: emailController,
                  label: "Password", icon: Icons.password, isHide: true, hintText: "Enter your password"),
              SizedBox(height: 30,),
              SizedBox(
                  height: 40.0,
                  width: 250,
                  child: ElevatedButton(onPressed: (){}, child:Text('Sign In')))
            ],
          ),
        ),
      ),
    );
  }
}


