import 'package:flutter/material.dart';
import 'package:logindice/DeskBody.dart';
import 'package:logindice/mobileBody.dart';

class ResponsiveLayout extends StatefulWidget {
  const ResponsiveLayout({Key? key, required mobileBody, required desktopBody})
      : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return const MobileBody();
        } else {
          return const DesktopBody();
        }
      },
    );
  }
}
