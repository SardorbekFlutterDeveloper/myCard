import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_card/router/router.dart';
import 'package:my_card/ui/components/app_init.dart';
import 'package:my_card/ui/files_import/files_import.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInit().appInitialized();
  // Hive.registerAdapter<CardsModel>(CardsModelAdapter());

  // await Hive.openBox(HiveKeys.cards.toString());
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      
      builder: (BuildContext context, Widget? child) {
        return MyApp();
      },
     
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: MyRouter.instance.onGnerateRoute,
      home: const CardPage(),
    );
  }
}
