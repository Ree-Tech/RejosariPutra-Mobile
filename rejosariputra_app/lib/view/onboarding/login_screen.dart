import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rejosariputra_app/values/rejosari_putra_icon_icons.dart';

import '../../values/colors.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailInputController = TextEditingController();
  final _passwordInputController = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.primary,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: SvgPicture.asset(
                    "assets/images/logo.svg",
                    height: MediaQuery.of(context).size.height * 0.12,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Datang",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Masuk untuk mengakses pembukuan.",
                        style: Theme.of(context).textTheme.bodyLarge?.apply(
                              color: ColorPalette.neutral[700],
                            ),
                      ),
                      const SizedBox(height: 30),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorPalette.neutral[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          autocorrect: false,
                          controller: _emailInputController,
                          keyboardType: TextInputType.emailAddress,
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            hintText: "Email",
                            hintStyle: Theme.of(context).textTheme.bodyLarge?.apply(
                                  color: ColorPalette.neutral[600],
                                ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: ColorPalette.neutral[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextField(
                          autocorrect: false,
                          controller: _passwordInputController,
                          obscureText: !_isPasswordVisible,
                          style: Theme.of(context).textTheme.bodyMedium,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                            hintText: "Password",
                            hintStyle: Theme.of(context).textTheme.bodyLarge?.apply(
                                  color: ColorPalette.neutral[600],
                                ),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                              icon: Icon(
                                _isPasswordVisible ? RejosariPutraIcons.eyeOff : RejosariPutraIcons.eye,
                                color: ColorPalette.neutral[600],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Checkbox(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            value: _isRememberMe,
                            onChanged: (value) {
                              setState(() {
                                _isRememberMe = value ?? !_isRememberMe;
                              });
                            },
                            side: const BorderSide(
                              width: 2,
                              color: ColorPalette.primary,
                            ),
                          ),
                          Text(
                            "Remember Me",
                            style: Theme.of(context).textTheme.bodyLarge?.apply(
                                  color: ColorPalette.neutral[700],
                                ),
                          )
                        ],
                      ),
                      const SizedBox(height: 30),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(HomeScreen.routeName);
                          },
                          child: const Text("Masuk"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
