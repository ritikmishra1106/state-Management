import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateless_widget/Provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController =  TextEditingController();
  TextEditingController passwordController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authProider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),)),
        backgroundColor: Colors.deepOrange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'EMail',
              ),

            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
              ),

            ),
            SizedBox(height: 20,),
            InkWell(
              onTap: (){
                authProider.login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: authProider.Loading?CircularProgressIndicator(color: Colors.white,): Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 20),),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
