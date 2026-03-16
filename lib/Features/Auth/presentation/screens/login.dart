import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_hive/Core/theme/app_spacing.dart';
import 'package:social_hive/Core/widgets/CustomButton.dart';
import 'package:social_hive/Core/widgets/CustomTextField.dart';
import 'package:social_hive/Features/Auth/presentation/Cubit/login_cubit.dart';
import 'package:social_hive/Features/Auth/presentation/Cubit/login_state.dart';
import 'package:social_hive/Features/Auth/presentation/screens/register.dart';
import 'package:social_hive/Features/Posts/presentation/screens/homescreen.dart';
import '../../../../Core/theme/app_colors.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double commonHeight = 20;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Welcome ${state.user.name}')),
            );

            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Homescreen(),
              ),
            );
          }

          if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: AppSpacing.padding(
                    context,
                    horizontal: 0.09,
                    vertical: 0.1,
                  ),
                  child: SizedBox(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: const DecorationImage(
                              image: AssetImage("assets/images/Logo.png"),
                            ),
                          ),
                        ),
                        Text(
                          "Welcome to Social Hive!",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.text,
                          ),
                        ),
                        Text(
                          "Sign in to continue",
                          style: TextStyle(
                            fontSize: 15,
                            color: AppColors.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email",
                        style: TextStyle(color: AppColors.TextFTitle),
                      ),
                      SizedBox(height: commonHeight),
                      Customtextfield(
                        controller: emailController,
                        hint: "Email",
                      ),
                      SizedBox(height: commonHeight),
                      Text(
                        "Password",
                        style: TextStyle(color: AppColors.TextFTitle),
                      ),
                      SizedBox(height: commonHeight),
                      Customtextfield(
                        controller: passwordController,
                        hint: "Password",
                        isPassword: true,
                      ),
                      SizedBox(height: commonHeight + 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                      ),
                      SizedBox(height: commonHeight),
                      state is LoginLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                        title: "Login",
                        onPressed: () {
                          context.read<LoginCubit>().login(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                        },
                        BgColor: AppColors.primary,
                      ),
                      SizedBox(height: commonHeight + 20),
                      Align(
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Register(),
                              ),
                            );
                          },
                          child: Text(
                            "Don't have an account? Register Now",
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}