import 'package:fake_store/widgets/offline_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class OfflineChecker extends StatelessWidget {
  Widget onlineWidget;
  OfflineChecker({Key? key, required this.onlineWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (
        BuildContext context,
        ConnectivityResult connectivity,
        Widget child,
      ) {
        final bool connected = connectivity != ConnectivityResult.none;
        if (connected) {
          return onlineWidget;
        } else {
          return const OfflineScreen();
        }
      },
      child: Container(),
    );
  }
}
