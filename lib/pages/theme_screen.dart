import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../shared/model_theme.dart';

class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
            title: Text(
          "App Theme",
          style: GoogleFonts.lato(),
        )),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Normal",
                  style: GoogleFonts.lato(
                      fontSize: 25, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 100,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Switch(
                    value: themeNotifier.isDark ? true : false,
                    onChanged: (value) {
                      themeNotifier.isDark
                          ? themeNotifier.isDark = false
                          : themeNotifier.isDark = true;
                    },
                  ),
                ),
              ),
              Text("Dark",
                  style: GoogleFonts.lato(
                      fontSize: 25, fontWeight: FontWeight.w600))
            ],
          ),
        ),
      );
    });
  }
}
