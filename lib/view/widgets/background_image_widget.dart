import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:structure_mvvm/res/assets/app_assets.dart';
import 'package:structure_mvvm/res/colors/app_colors.dart';

class BackGroundColorOrImageWidget extends StatefulWidget {
  final bool isBgRequired;
  final Widget child;
  final Widget? floatingActionButton;
  final String? imagePath;
  final Color? bgColor;
  final Gradient? bgGradient;
  final BoxFit? boxFit;
  final bool positionedFill;
  const BackGroundColorOrImageWidget({
    super.key,
    this.isBgRequired = true,
    this.positionedFill = true,
    required this.child,
    this.floatingActionButton,
    this.imagePath,
    this.bgColor,
    this.bgGradient,
    this.boxFit,
  });

  @override
  State<BackGroundColorOrImageWidget> createState() =>
      _BackGroundColorOrImageWidgetState();
}

class _BackGroundColorOrImageWidgetState
    extends State<BackGroundColorOrImageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        width: 1.sw,
        height: 1.sh,
        decoration: BoxDecoration(
          color: widget.bgColor,
          gradient: widget.bgColor == null
              ? widget.bgGradient ?? AppColors.bgGradientColor
              : null,
        ),
        child: widget.isBgRequired
            ? Stack(
                alignment: AlignmentGeometry.bottomCenter,
                children: [
                  widget.positionedFill
                      ? Positioned.fill(
                          child: Image.asset(
                            widget.imagePath ?? AppAssets.secondaryBgPattern,
                            fit: widget.boxFit ?? BoxFit.cover,
                          ),
                        )
                      : Positioned(
                          child: Image.asset(
                            widget.imagePath ?? AppAssets.secondaryBgPattern,
                            fit: widget.boxFit ?? BoxFit.cover,
                          ),
                        ),
                  Scaffold(
                    backgroundColor: Colors.transparent,
                    body: widget.child,
                  ),
                ],
              )
            : widget.child,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: widget.floatingActionButton,
    );
  }
}
