import 'package:fake_store/utils/ui/colors_utils.dart';
import 'package:flutter/material.dart';
import 'package:fake_store/generated/l10n.dart';

class OfflineScreen extends StatelessWidget {
  const OfflineScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.wifi_off,size: 200,color: ColorsUtils.red,),
             
                  Text(S.of(context).ooobs,style: TextStyle(fontSize: 30,color: ColorsUtils.gray),textAlign: TextAlign.center,),
                  Text(S.of(context).check_your_internet_connection,style: TextStyle(fontSize: 17,color: ColorsUtils.gray),textAlign: TextAlign.center),
                
             
            ],
          ),
        ),
      ),
    );
  }
}
