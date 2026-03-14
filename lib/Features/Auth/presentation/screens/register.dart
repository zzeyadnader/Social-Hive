import 'package:flutter/material.dart';
import 'package:social_hive/Core/theme/app_spacing.dart';
import 'package:social_hive/Core/widgets/CustomButton.dart';
import 'package:social_hive/Core/widgets/CustomTextField.dart';
import '../../../../Core/theme/app_colors.dart';
import '../../../../Core/widgets/CustomText.dart';
import 'login.dart';
class register extends StatelessWidget {
  const register({super.key});
  @override
  Widget build(BuildContext context) {
    double CommonHight = 10;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Top Container with Image & Text
            Padding(
              padding:AppSpacing.padding(context,horizontal: 0.09,  vertical: 0.1),
              child: Container(height: 200 ,width: double.infinity,
              child: Column(
                children: [
                  //Logo Container with Image
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
                  //Welcome Text
                  Text("Welcome to Social Hive!" , style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold , color: AppColors.text),),
                  //Sign in Text
                  Text("Sign up to continue" , style: TextStyle(fontSize: 15 , color: AppColors.muted),),
                ],
              ),),
            ),
            //Form Container
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name" , style: TextStyle(color: AppColors.TextFTitle),),
                  SizedBox(height: CommonHight,),
                  Customtextfield(controller: TextEditingController() , hint: "Name"),
                  SizedBox(height: CommonHight,),
                  Text("username" , style: TextStyle(color: AppColors.TextFTitle),),
                  SizedBox(height: CommonHight,),
                  Customtextfield(controller: TextEditingController() , hint: "username" , isPassword: false,),
                  SizedBox(height: CommonHight,),
                  Text("Email" , style: TextStyle(color: AppColors.TextFTitle),),
                  SizedBox(height: CommonHight,),
                  Customtextfield(controller: TextEditingController() , hint: "Email"),
                  SizedBox(height: CommonHight,),
                  Text("Password" , style: TextStyle(color: AppColors.TextFTitle),),
                  SizedBox(height: CommonHight,),
                  Customtextfield(controller: TextEditingController() , hint: "Password" , isPassword: true,),
                  SizedBox(height: CommonHight+40,),
                  CustomButton(title: "Sign up" , onPressed: (){},BgColor: AppColors.primary,),
                  SizedBox(height: CommonHight+20,),
                  Align(alignment: Alignment.center,
                    child:InkWell( onTap: () {
                      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => Login(),));
                    }, child: Text("Already have an account? Login" , style: TextStyle(color: AppColors.primary),),),
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
