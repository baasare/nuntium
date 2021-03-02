import 'package:flutter/material.dart';
import 'package:nuntium/models/user_model.dart';

import 'package:nuntium/utils/app_config.dart';
import 'package:nuntium/utils/theme.dart';
import 'package:provider/provider.dart';
import 'package:nuntium/routes/router.dart' as router;
import 'package:nuntium/routes/routes.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: UserModel(),
        ),
      ],
      child: MaterialApp(
        // app name
        title: AppConfig.appName,

        // app theme
        theme: AppTheme.lightTheme,

        // disable test banner
        debugShowCheckedModeBanner: false,

        //make flutter aware of app routes using router generator in router.dart file
        onGenerateRoute: router.generateRoute,

        initialRoute: splashViewRoute,
      ),
    );
  }
}
