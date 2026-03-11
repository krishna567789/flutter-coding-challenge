import 'package:flutter/material.dart';
import 'package:krishnacoadingchallenge/core/theme.dart';
import 'package:krishnacoadingchallenge/core/utils/responsiv_size.dart';
import 'package:krishnacoadingchallenge/widgets/app_cache_image.dart';
import 'package:krishnacoadingchallenge/widgets/app_text.dart';

import '../model/user_model.dart';
class UserDetailScreen extends StatelessWidget {
  final UserModel user;
  const UserDetailScreen({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        leading: BackButton(color: AppColors.white),
        title:  AppText("User Details",color: AppColors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppCachedImage(
                height: ResponsiveSize.hp(context, 18),
                  width:  ResponsiveSize.wp(context, 40),
                  borderRadius: 100,
                  fit: BoxFit.cover,
                  imageUrl: user.image),

               SizedBox(height:  ResponsiveSize.hp(context,2),),
              AppText(
                "${user.firstName} ${user.lastName}",
                  size: 22,
                  color: isDark?AppColors.white:AppColors.darkBackground,
                  weight: FontWeight.bold
              ),

              AppText(user.email,color: AppColors.textSecondary),

              SizedBox(height:  ResponsiveSize.hp(context,2),),

              AppText("Phone: ${user.phone}",color: AppColors.textSecondary),

              AppText(
                  "Location: ${user.city}, ${user.state}, ${user.country}",color: AppColors.textSecondary),

              AppText("Age: ${user.age}",color: AppColors.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}