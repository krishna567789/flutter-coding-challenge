import 'package:flutter/material.dart';
import 'package:krishnacoadingchallenge/core/utils/responsiv_size.dart';
import 'package:provider/provider.dart';
import 'package:krishnacoadingchallenge/core/theme.dart';
import 'package:krishnacoadingchallenge/widgets/app_text.dart';
import 'package:krishnacoadingchallenge/widgets/text_form.dart';

import '../core/utils/responsiv.dart';
import '../provider/theme_provider.dart';
import '../provider/user_controller.dart';
import '../widgets/user_card.dart';
import '../widgets/user_shimmer.dart';
import 'user_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final provider =
    Provider.of<UserProvider>(context, listen: false);
    Future.microtask(() => provider.fetchUsers());
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        provider.fetchUsers();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return IconButton(
                icon: Icon(
                  themeProvider.isDark
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
                onPressed: () {
                  themeProvider.toggleTheme();
                },
              );
            },
          )
        ],
        title: AppText(
          'Users',
          size: Responsive.isTablet(context) ? 20 : 18,
          weight: FontWeight.w500,
          color: AppColors.white,
        ),
      ),

      body: Consumer<UserProvider>(
        builder: (context, provider, child) {
          bool isDark = Theme.of(context).brightness == Brightness.dark;
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                    Responsive.isTablet(context) ? 24 : 8,
                    vertical: 8,
                  ),
                  child: AppSearchField(
                    onChanged: provider.search,
                    hintText: 'Search user',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal:
                    Responsive.isTablet(context) ? 24 : 8,
                  ),
                  child: Row(
                    children: [
                      AppText(
                        "Gender:",
                      color: isDark?AppColors.white:AppColors.darkBackground,
                        size: Responsive.isTablet(context)
                            ? 16
                            : 14,
                      ),

                      const SizedBox(width: 10),
                      DropdownButton<String>(
                      underline: Container(),
                        value: provider.genderFilter,
                        hint:  AppText("All",color:isDark?AppColors.white:AppColors.darkBackground,),
                        items:
                         [
                          DropdownMenuItem(
                            value: "male",
                            child: AppText("Male",color: isDark?AppColors.white:AppColors.darkBackground,),
                          ),
                          DropdownMenuItem(
                            value: "female",
                            child: AppText("Female",color:  isDark?AppColors.white:AppColors.darkBackground,),
                          ),
                        ],
                        onChanged: (value) {
                          provider.filterGender(value);
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: provider.refresh,
                    child: provider.isApiLoading &&
                        provider.filteredUsers.isEmpty
                        ? const UserShimmer()
                        : provider.filteredUsers.isEmpty
                        ? Center(
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person_off,
                            size: 60,
                            color: Colors.grey,
                          ),

                          SizedBox(
                            height: ResponsiveSize.hp(
                                context, 0.04),
                          ),

                          AppText(
                            "No Data Found",
                            size: 16,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                    )
                        : Responsive.isTablet(context)
                        ? GridView.builder(
                      controller: _scrollController,

                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3.5,
                      ),

                      itemCount:
                      provider.filteredUsers.length,

                      itemBuilder: (context, index) {
                        final user =
                        provider.filteredUsers[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    UserDetailScreen(
                                        user: user),
                              ),
                            );
                          },

                          child: UserCard(user: user),
                        );
                      },
                    )

                        : ListView.builder(
                      controller: _scrollController,

                      itemCount:
                      provider.filteredUsers.length,

                      itemBuilder: (context, index) {

                        final user =
                        provider.filteredUsers[index];

                        return GestureDetector(
                          onTap: () {

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    UserDetailScreen(
                                        user: user),
                              ),
                            );
                          },

                          child: UserCard(user: user),
                        );
                      },
                    ),
                  ),
                ),
                if (provider.isLoading &&
                    provider.filteredUsers.isNotEmpty &&
                    provider.hasMore)
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: CircularProgressIndicator(),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}