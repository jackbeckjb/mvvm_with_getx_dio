import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:structure_mvvm/core/service_locator.dart';
import 'package:structure_mvvm/res/extensions/themex_extension.dart';
import 'package:structure_mvvm/res/fonts/app_fonts.dart';
import 'package:structure_mvvm/utils/utils.dart';
import 'package:structure_mvvm/viewModels/controller/theme_controller.dart';
import 'package:structure_mvvm/viewModels/controller/user_controller.dart';

class HomeScreen extends StatefulWidget {
  final UserController controller;
  final ThemeController themeController;
  const HomeScreen({
    super.key,
    required this.controller,
    required this.themeController,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    widget.controller.loadUsers();
    super.initState();
  }

  @override
  void dispose() {
    if (getIt.isRegistered<UserController>()) {
      getIt.resetLazySingleton<UserController>(
        disposingFunction: (controller) => controller.dispose(),
      );
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              Utils.infoSnackBar(
                context,
                'Your message has been sent successfully.',
                title: 'Well done!',
              );
            },
            child: Text(
              "User",
              style: AppFonts.headingTextStyle.copyWith(
                color: context.adaptiveColor.black,
              ),
            ),
          ),

          actions: [
            IconButton(
              onPressed: () {
                widget.themeController.toggleTheme();
              },
              icon: Obx(
                () => Icon(
                  color: context.adaptiveColor.black,
                  widget.themeController.isLightMode.value
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
              ),
            ),
          ],
        ),
        body: Center(
          child: Obx(() {
            if (widget.controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            }

            if (widget.controller.users.isEmpty) {
              return Center(child: Text(widget.controller.message.value));
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: widget.controller.users.length,
              itemBuilder: (context, index) {
                final user = widget.controller.users[index];
                return ListTile(
                  leading: Image.network(user.avatar),
                  title: Text(user.displayName),
                  subtitle: Text(user.email),
                  trailing: user.isPremiumUser
                      ? Icon(Icons.verified, color: context.adaptiveColor.black)
                      : SizedBox.shrink(),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
