import 'package:flutter/material.dart';
import 'package:login/src/constants/routes.dart';
import 'package:login/src/constants/utils.dart';

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Login> {

  bool _passwordVisible = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(245, 240, 242, 245),
      body: SizedBox(
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Image(
                  image: NetworkImage(
                      "https://campusvirtual.unah.edu.hn/pluginfile.php/1/core_admin/logo/0x300/1688671142/thumbnail_logo-02.png"),
                  width: 160,
                ),
                Form(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: clearEmailField,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey.shade900),
                                    borderRadius: BorderRadius.circular(18.0),
                                    gapPadding: 2.0
                                ),
                                label: const Text(
                                  "Correo electrónico",
                                  style: TextStyle(
                                    fontSize: 17
                                  ),
                                )
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 12),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: _passwordVisible ? true : false,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                    icon: Icon(_passwordVisible ? Icons.visibility : Icons.visibility_off),
                                    onPressed: showPassword,
                                ),
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(18.0),
                                    gapPadding: 2.0
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey.shade900),
                                    borderRadius: BorderRadius.circular(18.0),
                                    gapPadding: 2.0
                                ),
                                label: const Text(
                                  "Contraseña",
                                  style: TextStyle(
                                      fontSize: 17
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 16),
                            child: FilledButton(
                              onPressed: login,
                              child: const Text("Iniciar sesión"),
                            ),
                          )
                        ]
                    )
                )
              ]
          )
      ),
    );
  }

  login(){
    final message = isValidInformation();
    if( message.isEmpty ){
      Navigator.pushNamed(context, myRoutes.home.name);
    } else {
      final snackBar = SnackBar(
        content: Text(message),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  String isValidInformation(){
    if(emailController.text.isEmpty){
      return 'Ingrese el correo electrónico';
    }
    if(passwordController.text.isEmpty){
      return 'Ingrese la contraseña';
    }

    final List<Map<String, dynamic>> users = listUsers;
    final user = users.firstWhere((user) => user['email'] == emailController.text, orElse: () => {});

    if( user.isEmpty ){
      return 'El correo institucional ingresado es incorrecto';
    }
    if( passwordController.text != user['password'] ){
      return 'La contraseña ingresada es incorrecta';
    }
    return '';
  }

  showPassword(){
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  clearEmailField(){
    emailController.text = '';
  }
}
