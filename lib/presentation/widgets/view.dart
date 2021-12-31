import 'package:fake_store/utils/navigation/app_router.dart';
import 'package:flutter/material.dart';


abstract class View extends StatefulWidget {
  const View({Key? key}) : super(key: key);

  View get instance;

  String get route => AppRouter.addRoute(screen: instance);

  @override
  ViewState createState();
}

abstract class ViewState<T extends View> extends State<T> {
  String get routeName;

  @override
  void dispose() {
    AppRouter.removeRoute(routeName: routeName);
    super.dispose();
  }
}
