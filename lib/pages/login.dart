import 'package:flutter/material.dart';
import 'package:login_page1/pages/SignUp.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode _focus = FocusNode();
  FocusNode _focu = FocusNode();

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromRGBO(32, 37, 75, 1),
                  Color.fromRGBO(42, 50, 117, 1),
                  Color.fromRGBO(41, 80, 255, 0.447),
                ],
              ),
            ),
            child: Column(
              children: [
                Row(
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
                        style:
                            TextStyle(color: Color.fromRGBO(228, 228, 228, 1)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(62, 62, 85, 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        autofocus: true,
                        focusNode: _focu,
                        onTapOutside: (event) => _focu.unfocus(),
                        textAlignVertical: TextAlignVertical.top,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 18),
                          hintText: "Your Email",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(151, 255, 255, 255)),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 40, top: 10),
                      child: const Text(
                        "Password",
                        style:
                            TextStyle(color: Color.fromRGBO(228, 228, 228, 1)),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(62, 62, 85, 1),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        autofocus: true,
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
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 18),
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Color.fromARGB(151, 255, 255, 255)),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 40, top: 10),
                          child: Text(
                            "Forget Password?",
                            style: TextStyle(
                                color: Color.fromRGBO(184, 184, 210, 1)),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Container(
                        width: double.infinity, // Mengisi lebar layar
                        margin: EdgeInsets.symmetric(
                            horizontal:
                                40), // Margin samping untuk memberikan jarak dari tepi layar
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 0, 117, 212),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          child: Text(
                            "Log In",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: AutofillHints.addressCity,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 184, 184, 210)),
                        ),
                        SizedBox(height: 5),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUp_page(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                              thickness: 1,
                              color: Color.fromARGB(255, 184, 184, 210))),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          "Or login with",
                          style: TextStyle(
                            color: Color.fromARGB(255, 184, 184, 210),
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                              thickness: 1,
                              color: Color.fromARGB(255, 184, 184, 210))),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/google_logo.png'),
                    SizedBox(
                      width: 20,
                    ),
                    Image.asset('images/facebook_logo.png'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
