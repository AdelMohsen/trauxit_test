import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:trauxit_test/logic/authentication/auth/auth_cubit.dart';
import 'package:trauxit_test/logic/nav_bar_screens/cart/cart_cubit.dart';
import 'package:trauxit_test/logic/nav_bar_screens/home_layout/home_layout_cubit.dart';
import 'package:trauxit_test/logic/nav_bar_screens/home_screen/home_cubit.dart';
import 'package:trauxit_test/logic/nav_bar_screens/search/search_cubit.dart';
import 'package:trauxit_test/presentation/welcome_screen.dart';
import 'package:trauxit_test/utilities/network/dio_helper.dart';
import 'package:trauxit_test/utilities/network/ob_server.dart';
import 'package:trauxit_test/utilities/network/shared_pref.dart';

import 'logic/nav_bar_screens/counter/counter_with_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  DioHelper.init();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Counter(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(create: (context) => HomeLayoutCubit()),
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => SearchCubit()),
          BlocProvider(create: (context) => CartCubit()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Traxuit Test',
          home: WelcomeScreen(),
        ),
      ),
    );
  }
}
