import 'package:asyncstate/asyncstate.dart';
import 'package:dw_barbershop/src/core/ui/barbershop_nav_global_key.dart';
import 'package:dw_barbershop/src/core/ui/barbershop_theme.dart';
import 'package:dw_barbershop/src/core/ui/widgets/barbershop_lodaer.dart';
import 'package:dw_barbershop/src/features/auth/login/login_page.dart';
import 'package:dw_barbershop/src/features/auth/register/user_register_page.dart';
import 'package:dw_barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarbershopLodaer(),
      builder: (asyncNavigatorObserver) {
        return MaterialApp(
          theme: BarbershopTheme.themeData,
          title: 'DW Barbershop',
          navigatorObservers: [asyncNavigatorObserver],
          navigatorKey: BarbershopNavGlobalKey.instance.navKey,
          routes: {
            '/': (_) => const SplashPage(),
            '/auth/login': (_) => const LoginPage(),
            '/home/adm': (_) => const Text('Adm'),
            '/auth/register/barbershop': (_) =>
                const Center(child: Text('Barbershop Page')),
            '/home/employee': (_) => const Text('Employee'),
            '/auth/register/user': (_) => const UserRegisterPage(),
          },
        );
      },
    );
  }
}
