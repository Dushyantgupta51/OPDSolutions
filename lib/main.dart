import 'package:flutter/material.dart';
import 'package:opdsolution/app/app.bottomsheets.dart';
import 'package:opdsolution/app/app.dialogs.dart';
import 'package:opdsolution/app/app.locator.dart';
import 'package:opdsolution/app/app.router.dart';
import 'package:opdsolution/ui/common/app_theme.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  setupDialogUi();
  setupBottomSheetUi();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: activeTheme(),
        initialRoute: Routes.authView,
        onGenerateRoute: StackedRouter().onGenerateRoute,
        navigatorKey: StackedService.navigatorKey,
        navigatorObservers: [StackedService.routeObserver]);
  }
}
