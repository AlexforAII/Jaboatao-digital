import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController textFormFieldEmail = TextEditingController();
  TextEditingController textFormFieldPassword = TextEditingController();
  bool isTextObscure = true;
  Icon IconPic = const Icon(Icons.visibility_rounded);

  @override
  void dispose() {
    textFormFieldEmail.dispose();
    textFormFieldPassword.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/background.png',
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Container(
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: textFormFieldEmail,
                      keyboardType: TextInputType.emailAddress,
                      initialValue: null,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.mail),
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'Insira o seu endereço de email',
                        fillColor: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20, left: 20),
                child: Container(
                  height: size.height * 0.08,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                      controller: textFormFieldPassword,
                      keyboardType: TextInputType.visiblePassword,
                      initialValue: null,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.key),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              if (isTextObscure) {
                                IconPic =
                                    const Icon(Icons.visibility_off_rounded);
                                isTextObscure = false;
                              } else {
                                IconPic = const Icon(Icons.visibility_rounded);
                                isTextObscure = true;
                              }
                            });
                          },
                          icon: IconPic,
                        ),
                        filled: true,
                        border: InputBorder.none,
                        hintText: 'Coloque sua senha',
                        fillColor: Colors.transparent,
                      ),
                      obscureText: isTextObscure,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, top: 20),
                child: SizedBox(
                  height: size.height * 0.08,
                  width: size.width * 0.9,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/home");
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF30314D),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      'ENTRAR COM EMAIL',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
              RichText(
                text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                    ),
                    text: 'Esqueceu sua senha? ',
                    children: [
                      TextSpan(
                          text: 'Clique aqui',
                          style: TextStyle(
                            color: Color(0xFF59422E),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ))
                    ]),
              ),
              RichText(
                text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 15,
                    ),
                    text: 'Criar conta? ',
                    children: [
                      TextSpan(
                          text: 'Clique aqui',
                          style: TextStyle(
                            color: Color(0xFF59422E),
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ))
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
