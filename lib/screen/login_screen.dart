import 'package:flutter/material.dart';
import 'package:productivity_app/screen/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            // Header Illustration
            Center(
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Icon(
                    Icons.check_circle_outline_rounded,
                    size: 64,
                    color: Colors.blue
                  ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Text("Welcome Back!", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),),
        
            SizedBox(height: 50,),
        
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white)),
                          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white)),
                        labelText: "Email Address",
                        prefixIcon: Icon(Icons.email_outlined),
                        fillColor: Colors.white,
                        filled: true
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return "Please enter your email address";
                        }
                        return null;
                      },
        
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white)),
                        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide(color: Colors.white)),
                        labelText: "Password",
                        prefixIcon: Icon(Icons.password),
                        fillColor: Colors.white,
                        filled: true
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty) {
                          return "Please enter your password";
                        }
                        return null;
                      },
                    ),
                    
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.only(left: 260),
                      child: TextButton(
                          onPressed: () {},
                          child: Text("Forgot Password?", style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),)),
                    ),
        
                    SizedBox(height: 20,),
        
                    //Login Button
                    ElevatedButton(
                      onPressed: () {
                        if(formKey.currentState!.validate()) {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen()));
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        elevation: 8,
                        shadowColor: Colors.blue.withOpacity(0.3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        minimumSize: Size(400, 50)
                      ),
                      child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
        
        
                    SizedBox(height: 10,),
                    //Submitted Button
                    ElevatedButton(
                      onPressed: () {
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(color: Colors.blue, width: 1.5)
                        ),
                        minimumSize: Size(400, 50)
                      ),
                      child: Text("Create Account", style: TextStyle(color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold)),
                    ),
        
        
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
