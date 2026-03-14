 import 'package:flutter/material.dart';
import 'package:social_hive/Core/theme/app_colors.dart';
import 'package:social_hive/Core/theme/app_spacing.dart';
import 'package:social_hive/Core/widgets/CustomTextField.dart';
import 'package:social_hive/Features/Posts/presentation/widgets/CustomPostContainer.dart';

import '../../../../Core/widgets/custom_bottom_nav_bar.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});
  final TextEditingController postController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavBar(
    currentIndex: 0,
          onTap: (index) {

          },
        ) ,
        backgroundColor: AppColors.background,
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Container(
                padding: AppSpacing.padding(context,horizontal: 0.03 ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage("assets/images/Profile.jpeg"),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Material(
                          color: AppColors.TextFiledBackground,
                          child: TextField(
                            readOnly: true,
                            onTap:() {
                            },
                            controller: postController,
                            decoration: InputDecoration(
                              hintText: "What's on your mind?",
                              hintStyle: const TextStyle(color: AppColors.muted),
                              filled: true,
                              fillColor: AppColors.TextFiledBackground,
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 16,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: AppColors.muted,
                                ),
                              ),

                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: AppColors.muted,
                                ),
                              ),

                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: const BorderSide(
                                  color: AppColors.muted,
                                  width: 1.5,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),
              PostContainer(
                username: 'Zeyad Nader',
                timeAgo: '2h ago',
                caption: '".التخلّي علاج .. وإن كان أوّله مُر"',
                profileImage: 'assets/images/Profile.jpeg',
                postImage: 'assets/images/Post.jpeg',
                likes: 234,
                comments: 18,
              ),
              PostContainer(
                username: 'Zeyad Nader',
                timeAgo: '2h ago',
                caption: '".التخلّي علاج .. وإن كان أوّله مُر"',
                profileImage: 'assets/images/Profile.jpeg',
                postImage: 'assets/images/Post.jpeg',
                likes: 234,
                comments: 18,
              ),
              PostContainer(
                username: 'Zeyad Nader',
                timeAgo: '2h ago',
                caption: '".التخلّي علاج .. وإن كان أوّله مُر"',
                profileImage: 'assets/images/Profile.jpeg',
                postImage: 'assets/images/Post.jpeg',
                likes: 234,
                comments: 18,
              ),
              PostContainer(
                username: 'Zeyad Nader',
                timeAgo: '2h ago',
                caption: '".التخلّي علاج .. وإن كان أوّله مُر"',
                profileImage: 'assets/images/Profile.jpeg',
                postImage: 'assets/images/Post.jpeg',
                likes: 234,
                comments: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
