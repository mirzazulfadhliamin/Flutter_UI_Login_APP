import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FocusNode _focus = FocusNode();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF1E2349),
              Color(0xFF6069A2),
            ],
          ),
        ),
        child: Column(
          
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20),
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                Image.asset('images/vector1.png'),
              ],
            ),
            Image.asset(
              'images/logo.png',
              width: 350,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 40, top: 30),
                  child: const Text(
                    "Your Email",
                    style: TextStyle(color: Color.fromRGBO(228, 228, 228, 1)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(62, 62, 85, 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: const TextField(
                      textAlignVertical: TextAlignVertical.top,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          hintText: "Your Email",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(151, 255, 255, 255)),
                          border: InputBorder.none)),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: const Text(
                    "Password",
                    style: TextStyle(color: Color.fromRGBO(228, 228, 228, 1)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(62, 62, 85, 1),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    obscureText: _obscureText,
                    focusNode: _focus,
                    onTapOutside: (event) => _focus.unfocus(),
                    cursorColor: Colors.white,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        child: Icon(
                          _obscureText
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: Color.fromRGBO(184, 184, 210, 1),
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      hintText: "Password",
                      hintStyle:
                          TextStyle(color: Color.fromARGB(151, 255, 255, 255)),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
