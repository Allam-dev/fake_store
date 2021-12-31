import 'package:fake_store/data/services/local/storage/storage_keys.dart';
import 'package:fake_store/data/services/local/storage/storage_services.dart';
import 'package:fake_store/presentation/widgets/app_blocs.dart';
import 'package:fake_store/presentation/screens/login/ui/login_view.dart';
import 'package:fake_store/utils/navigation/app_router.dart';
import 'package:fake_store/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  static final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();

  @override
  State<App> createState() => _AppState();

  static GlobalKey<ScaffoldMessengerState> get scaffoldMessengerKey =>
      _scaffoldMessengerKey;
  static GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return AppBlocs(
      child: MaterialApp(
        title: 'fake store',
        scaffoldMessengerKey: App._scaffoldMessengerKey,
        navigatorKey: App._navigatorKey,
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: const LoginView().route,
        routes: AppRouter.routes,
      ),
    );
  }

  @override
  void dispose() {
    StorageServices.close();
    super.dispose();
  }
  
}
