import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:structure_mvvm/res/colors/app_colors.dart';
import 'package:structure_mvvm/res/fonts/app_fonts.dart';
import 'package:structure_mvvm/utils/snackbar/custom_snackbar.dart';
import 'package:structure_mvvm/utils/utils.dart';
import 'package:structure_mvvm/viewModels/controller/user_controller.dart';

class HomeScreen extends StatefulWidget {
  final UserController controller;
  const HomeScreen({super.key, required this.controller});

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
              style: AppFonts.headingTextStyle.copyWith(color: AppColors.black),
            ),
          ),
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
                  title: Text(user.firstName),
                  subtitle: Text(user.email),
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
