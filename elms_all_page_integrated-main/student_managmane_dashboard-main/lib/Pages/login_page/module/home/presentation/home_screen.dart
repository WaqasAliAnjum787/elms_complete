import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:student_managmane_dashboard/Pages/Dashboard/DashboardPage/dashboard_page.dart';
import 'package:student_managmane_dashboard/Pages/login_page/core/theme/app_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String name = "login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String validEmail = "Dandi@gmail.com";
  String validPassword = "12345";

  /// input form controller
  FocusNode emailFocusNode = FocusNode();
  TextEditingController emailController = TextEditingController();

  FocusNode passwordFocusNode = FocusNode();
  TextEditingController passwordController = TextEditingController();

  /// rive controller and input
  StateMachineController? controller;

  SMIInput<bool>? isChecking;
  SMIInput<double>? numLook;
  SMIInput<bool>? isHandsUp;

  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  @override
  void initState() {
    emailFocusNode.addListener(emailFocus);
    passwordFocusNode.addListener(passwordFocus);
    super.initState();
  }

  @override
  void dispose() {
    emailFocusNode.removeListener(emailFocus);
    passwordFocusNode.removeListener(passwordFocus);
    super.dispose();
  }

  void emailFocus() {
    isChecking?.change(emailFocusNode.hasFocus);
  }

  void passwordFocus() {
    isHandsUp?.change(passwordFocusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    print("Build Called Again");
    return Scaffold(
      backgroundColor: const Color(0xFFD6E2EA),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 32),
            Text(
              "Welcome Back \n ENGR . MASK",
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 250,
              width: 250,
              // child: RiveAnimation.asset(
              //   "assets/login-teddy.riv",
              //   fit: BoxFit.fitHeight,
              //   stateMachines: const ["Login Machine"],
              //   onInit: (artboard) {
              //     controller = StateMachineController.fromArtboard(
              //       artboard,

              //       /// from rive, you can see it in rive editor
              //       "Login Machine",
              //     );
              //     if (controller == null) return;

              //     artboard.addController(controller!);
              //     isChecking = controller?.findInput("isChecking");
              //     numLook = controller?.findInput("numLook");
              //     isHandsUp = controller?.findInput("isHandsUp");
              //     trigSuccess = controller?.findInput("trigSuccess");
              //     trigFail = controller?.findInput("trigFail");
              //   },
              // ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: TextField(
                      focusNode: emailFocusNode,
                      controller: emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Email",
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                      onChanged: (value) {
                        numLook?.change(value.length.toDouble());
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: TextField(
                      focusNode: passwordFocusNode,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Password",
                      ),
                      obscureText: true,
                      style: Theme.of(context).textTheme.bodyMedium,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 64,
                    child: ElevatedButton(
                      onPressed: () async {
                        emailFocusNode.unfocus();
                        passwordFocusNode.unfocus();

                        final email = emailController.text;
                        final password = passwordController.text;

                        if (email == validEmail && password == validPassword) {
                          trigSuccess?.change(true);
                        } else {
                          trigFail?.change(true);
                        }

                        Navigator.pushNamed(context, Dashboard.name);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text("Login"),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.055,
                    child: TextButton(
                        onPressed: () {
                          trigFail?.change(true);
                        },
                        child: Text("Forget Password")),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.055,
                    child: TextButton(
                        onPressed: () {
                          trigSuccess?.change(true);
                        },
                        child: Text("New User ?? ")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
