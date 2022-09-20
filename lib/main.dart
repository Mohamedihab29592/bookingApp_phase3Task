import 'package:flutter/material.dart';
import 'core/routes/routes_manager.dart';
import 'core/utilis/constants/app_strings.dart';
import 'injection_container.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MotelApp());
}

class MotelApp extends StatelessWidget {
  const MotelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.registerRoute,
      onGenerateRoute: RouteGenerator.getRoute,



    );
  }
}
