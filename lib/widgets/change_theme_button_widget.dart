import 'package:flutter/material.dart';
import 'package:new_life/utils/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:flutter_switch/flutter_switch.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  const ChangeThemeButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool isDarkMode = brightness == Brightness.dark;
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Switch.adaptive(
      activeColor: Colors.black,
      activeTrackColor: Colors.white.withOpacity(0.4),
      inactiveTrackColor: Colors.yellow.withOpacity(0.3),

      value: themeProvider.isDarkMode ,
      inactiveThumbImage: AssetImage('assets/light_mode_3.png'),
      activeThumbImage: AssetImage('assets/dark_mode.png'),
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}
