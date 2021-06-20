import 'package:app/mixins/ValidationMixin.dart';
import 'package:app/pages/Dashboard.dart';
import 'package:app/pages/Login.dart';
import 'package:app/widgets/CustomTextFormField.dart';
import 'package:app/widgets/PasswordField.dart';
import 'package:app/widgets/PrimaryButton.dart';
import 'package:app/widgets/SecondaryButton.dart';
import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  static const String routeName = "Registration";
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> with ValidationMixin{

  GlobalKey<FormState> formKey =  GlobalKey<FormState>();
  final TextEditingController emailTextController = TextEditingController();
  final TextEditingController nameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://images.unsplash.com/photo-1503256207526-0d5d80fa2f47?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=633&q=80"
            ),
            fit: BoxFit.cover,
            colorFilter: 
              ColorFilter.mode(Colors.black87.withOpacity(0.8), 
              BlendMode.multiply),
          ),
        ),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
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
                  Text("Create Account",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.teal,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(
                    height: 25.0
                  ),
                  CustomTextFormField(
                    labelText: "Your Name", 
                    hintText: "Your Name Here", 
                    iconData: Icons.face, 
                    textEditingController: nameTextController, 
                    textInputType: TextInputType.name,
                    validation: validateName,),
                  SizedBox(
                    height: 20.0,
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
                  PrimaryButton(text: "Register", iconData: Icons.login, onPress: login),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SecondaryButton(text: "Login Instead", onPress: (){
                        navigateToLogin(context);
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

  void navigateToLogin(BuildContext context){
    Navigator.pushNamed(context, Login.routeName);
  }
}