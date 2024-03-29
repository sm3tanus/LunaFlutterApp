import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:luna/classes/movingUser.dart';
import 'package:toast/toast.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          "assets/images/bunner.jpg",
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height / 2.2,
                          fit: BoxFit.cover,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 2.3),
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              topRight: Radius.circular(20.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: 23, top: 7, bottom: 7, right: 20),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 230, 0, 1),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15.0),
                          bottomRight: Radius.circular(15.0),
                        ),
                      ),
                      child: Text(
                        'ДОБРО ПОЖАЛОВАТЬ,',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 50,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 1.1,
                  height: 50,
                  child: TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 1.0,
                        ),
                      ),
                      labelText: 'Пароль',
                      labelStyle: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Забыли пароль?',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            final auth = Authentication(FirebaseAuth.instance);

                            final credential =
                                await auth.signInWithEmailAndPassword(
                                    _emailController.text, _passwordController.text);
                            if (credential != null) {
                             Navigator.pushNamed(context, '/catalogPage');
                            } else {
                              Toast.show("Неверные данные",
                                  backgroundColor: Colors.transparent,
                                  textStyle: TextStyle(color: Colors.red));
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                              const Color.fromRGBO(255, 233, 0, 1),
                            ),
                            elevation: MaterialStateProperty.all<double>(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  bottomLeft: Radius.circular(15.0),
                                ),
                              ),
                            ),
                          ),
                          child: Text(
                            'ВОЙТИ',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  height: 2,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 230, 0, 1),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/catalogPage');
                          },
                          child: Text(
                            'Гость',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/registerPage');
                          },
                          child: Text(
                            'Создать аккаунт',
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height - 60)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "L U N A",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
