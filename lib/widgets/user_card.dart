import 'package:flutter/material.dart';
import 'package:krishnacoadingchallenge/core/theme.dart';
import '../model/user_model.dart';
import 'app_cache_image.dart';
import 'app_text.dart';


class UserCard extends StatelessWidget {
  final
  UserModel user;
  const UserCard({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      leading: AppCachedImage(
        imageUrl: user.image,
        width: 40,
        height: 40,
        borderRadius: 50,
        fit: BoxFit.cover,
      ),
      title: AppText("${user.firstName} ${user.lastName}",size: 16,color: isDark?AppColors.white:AppColors.darkBackground),
      subtitle: AppText(user.email,size: 13,color: AppColors.textSecondary),
    );
  }
}