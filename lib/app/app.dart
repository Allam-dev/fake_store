import 'package:fake_store/app/app_router.dart';
import 'package:fake_store/generated/l10n.dart';
import 'package:fake_store/screens/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fake store',
      scaffoldMessengerKey: _scaffoldMessengerKey,
      navigatorKey: _navigatorKey,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: const LoginView().route,
      routes: AppRouter.routes,
    );
  }

  static GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _scaffoldMessengerKey;
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
}
