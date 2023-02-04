import 'package:flutter/material.dart';
import 'package:netgeek/core/theme/app_theme.dart';

import 'package:netgeek/features/login/ui/pages/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  void _unFocus(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: GestureDetector(
          onTap: () => _unFocus(context),
          child: LoginPage(),
        ),
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
          child: child!,
        ),
      );
}
