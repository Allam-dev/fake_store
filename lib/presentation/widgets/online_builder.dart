import 'package:fake_store/presentation/widgets/offline_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';

class OnlineBuilder extends StatelessWidget {
  Widget onlineWidget;
  OnlineBuilder({Key? key, required this.onlineWidget}) : super(key: key);

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
