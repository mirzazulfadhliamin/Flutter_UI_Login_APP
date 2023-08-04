import 'package:flutter/material.dart';
import 'package:login_page1/pages/login.dart';

class SignUp_page extends StatefulWidget {
  const SignUp_page({super.key});

  @override
  State<SignUp_page> createState() => _SignUp_pageState();
}

class _SignUp_pageState extends State<SignUp_page> {
  List<String> _list = [];
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode _focus = FocusNode();
  FocusNode _focu = FocusNode();
  FocusNode _focus_username = FocusNode();
  FocusNode _focu_number = FocusNode();

  bool _isCheck = false;
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20),
                        child: const Text(
                          "Enter your details below & free sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Image.asset(
                    'images/vector1.png',
                    width: 120,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 25),
                child: Text("Username"),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(62, 62, 85, 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  autofocus: true,
                  textAlignVertical: TextAlignVertical.center,
                  focusNode: _focus_username,
                  onTapOutside: (event) => _focus_username.unfocus(),
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintText: "Enter your username",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(151, 255, 255, 255)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, top: 15),
                child: Text("Email"),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(62, 62, 85, 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  autofocus: true,
                  textAlignVertical: TextAlignVertical.center,
                  focusNode: _focus,
                  onTapOutside: (event) => _focus.unfocus(),
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintText: "Your email address",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(151, 255, 255, 255)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, top: 15),
                child: Text("Password"),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(62, 62, 85, 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  autofocus: true,
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: _obscureText,
                  focusNode: _focu,
                  onTapOutside: (event) => _focu.unfocus(),
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
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintText: "Enter your password",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(151, 255, 255, 255)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, top: 15),
                child: Text("Phone Number"),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(62, 62, 85, 1),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: const EdgeInsets.symmetric(horizontal: 25),
                child: TextField(
                  autofocus: true,
                  textAlignVertical: TextAlignVertical.top,
                  focusNode: _focu_number,
                  onTapOutside: (event) => _focu_number.unfocus(),
                  cursorColor: Colors.white,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    hintText: "Your  phone number",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(151, 255, 255, 255)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 25, right: 25, top: 25),
                width: MediaQuery.of(context).size.width * 1,
                height: 45,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Create account",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: AutofillHints.addressCity),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 0, 117, 212),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: Container(
                  margin: const EdgeInsets.only(right: 20),
                  child: const Text(
                    "By creating an account you have to agree with our them & condication.",
                    style: TextStyle(
                      fontFamily: AutofillHints.addressCity,
                      color: Color.fromARGB(255, 227, 227, 227),
                      fontSize: 12,
                    ),
                  ),
                ),
                leading: Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Checkbox(
                    value: _isCheck,
                    onChanged: (value) {
                      setState(() {
                        _isCheck = value!;
                        String selectVal = "agree";
                        value! ? _list.add(selectVal) : _list.remove(selectVal);
                      });
                    },
                    visualDensity: VisualDensity.compact,
                    checkColor: Colors.white,
                    fillColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent,
                    ),
                    side: BorderSide(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text(
                      "Already have an account ？",
                      style: TextStyle(
                          fontFamily: AutofillHints.addressCity,
                          fontSize: 16,
                          color: Color.fromARGB(255, 184, 184, 210)),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                          fontFamily: AutofillHints.addressCity,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('images/google_logo.png'),
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset('images/facebook_logo.png'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
