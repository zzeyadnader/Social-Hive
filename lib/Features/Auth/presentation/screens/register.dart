import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_hive/Core/theme/app_spacing.dart';
import 'package:social_hive/Core/widgets/CustomButton.dart';
import 'package:social_hive/Core/widgets/CustomTextField.dart';
import 'package:social_hive/Features/Auth/presentation/Cubit/register_cubit.dart';
import 'package:social_hive/Features/Auth/presentation/Cubit/register_state.dart';
import 'package:social_hive/Features/Posts/presentation/screens/homescreen.dart';
import '../../../../Core/theme/app_colors.dart';
import 'login.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double commonHeight = 10;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => Homescreen()),
                  (route) => false,
            );
          }

          if (state is RegisterError) {
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
                          "Sign up to continue",
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
                        "Name",
                        style: TextStyle(color: AppColors.TextFTitle),
                      ),
                      SizedBox(height: commonHeight),
                      Customtextfield(
                        controller: nameController,
                        hint: "Name",
                      ),
                      SizedBox(height: commonHeight),

                      Text(
                        "Username",
                        style: TextStyle(color: AppColors.TextFTitle),
                      ),
                      SizedBox(height: commonHeight),
                      Customtextfield(
                        controller: usernameController,
                        hint: "Username",
                      ),
                      SizedBox(height: commonHeight),

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
                      SizedBox(height: commonHeight + 40),

                      state is RegisterLoading
                          ? const Center(child: CircularProgressIndicator())
                          : CustomButton(
                        title: "Sign up",
                        onPressed: () {
                          context.read<RegisterCubit>().register(
                            email: emailController.text.trim(),
                            username: usernameController.text.trim(),
                            password: passwordController.text.trim(),
                            name: nameController.text.trim(),
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
                                builder: (context) => const Login(),
                              ),
                            );
                          },
                          child: Text(
                            "Already have an account? Login",
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