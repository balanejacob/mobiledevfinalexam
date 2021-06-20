import 'package:app/mixins/ValidationMixin.dart';
import 'package:app/pages/Dashboard.dart';
import 'package:app/pages/Registration.dart';
import 'package:app/widgets/CustomTextFormField.dart';
import 'package:app/widgets/PasswordField.dart';
import 'package:app/widgets/PrimaryButton.dart';
import 'package:app/widgets/SecondaryButton.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String routeName = "Login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with ValidationMixin {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://images.unsplash.com/photo-1552053831-71594a27632d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=612&q=80"
            ),
            fit: BoxFit.cover,
            colorFilter: 
              ColorFilter.mode(Colors.black87.withOpacity(0.7), 
              BlendMode.multiply),
          ),
        ),
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child:Center( 
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Randog",
                    style: TextStyle(
                      fontSize: 60.0,
                      color: Colors.tealAccent,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 5.0,
                    ),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text("Your Random Dog Picture App",
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.teal,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  CustomTextFormField(
                    labelText: "Email Address", 
                    hintText: "Enter Valid Email", 
                    iconData: Icons.email, 
                    textEditingController: emailTextController, 
                    textInputType: TextInputType.emailAddress,
                    validation: validateEmail,),
                  SizedBox(
                    height: 20.0,
                  ),
                  PasswordField(
                    labelText: "Password", 
                    hintText: "Enter your password",
                    obscureText: obscureText, 
                    onTap: setPasswordVisibility,
                    validation: validatePassword,
                    textEditingController: passwordTextController,),
                  SizedBox(
                    height: 20.0,
                  ),
                  PrimaryButton(text: "Login", iconData: Icons.login, onPress: login),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SecondaryButton(text: "New User? Register", onPress: (){
                        navigateToRegistration(context);
                      }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
  
  void login(){
    if(formKey.currentState.validate()){
      Navigator.pushReplacementNamed(context, Dashboard.routeName);
    }
  }

  void setPasswordVisibility(){
    setState(() {
      obscureText = !obscureText;
    });
  }

  void navigateToRegistration(BuildContext context){
    Navigator.pushNamed(context, Registration.routeName);
  }
}