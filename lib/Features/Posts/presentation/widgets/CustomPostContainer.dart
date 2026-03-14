import 'package:flutter/material.dart';
import 'package:social_hive/Core/theme/app_colors.dart';
import 'package:social_hive/Core/theme/app_spacing.dart';

class PostContainer extends StatelessWidget {
  final String username;
  final String timeAgo;
  final String caption;
  final String profileImage;
  final String postImage;
  final int likes;
  final int comments;

  const PostContainer({
    super.key,
    required this.username,
    required this.timeAgo,
    required this.caption,
    required this.profileImage,
    required this.postImage,
    required this.likes,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: AppSpacing.width(context,0.9),
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColors.PostContainer,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: AppColors.PostContainerBorder,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14, 14, 14, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 22,
                        backgroundImage: AssetImage(profileImage),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            username,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF374151),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            timeAgo,
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppColors.muted,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Text(
                    caption,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.7,
                      color: Color(0xFF374151),
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              postImage,
              height: 340,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.favorite_border, color: Color(0xFF9CA3AF)),
                  const SizedBox(width: 8),
                  Text(
                    '$likes',
                    style: const TextStyle(color: AppColors.muted,),
                  ),
                  const SizedBox(width: 24),
                  const Icon(Icons.mode_comment_outlined,
                      color: Color(0xFF9CA3AF)),
                  const SizedBox(width: 8),
                  Text(
                    '$comments',
                    style: const TextStyle(color: AppColors.muted),
                  ),
                  const Spacer(),
                  const Icon(Icons.share_outlined, color: AppColors.muted),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}