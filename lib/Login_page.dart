import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/PlayList.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget{
  const LoginScreen({Key? key}) :super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  @override
    Widget build(BuildContext context){
Size size = MediaQuery.of(context).size;

      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('images/background.png'),  
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      height: size.height * 0.08,
                      decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                       ),
                    ),
                    ),
                ],
                ),
              ),
            ),
        ),
      ),
    }
}