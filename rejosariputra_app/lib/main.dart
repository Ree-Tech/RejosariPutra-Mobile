import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'values/colors.dart';
import 'view/home/catatan_keuangan_screen.dart';
import 'view/home/home_screen.dart';
import 'view/onboarding/login_screen.dart';
import 'view/home/pembelian/pembelian_list_screen.dart';
import 'view/home/penjualan/penjualan_list_screen.dart';
import 'view/onboarding/splash_screen.dart';

void main() {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rejosariputra',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primarySwatch: ColorPalette.primary,
        fontFamily: "Inter",
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: ColorPalette.primary,
        ),
        dividerTheme: DividerThemeData(
          color: ColorPalette.neutral[300],
          indent: 20,
          endIndent: 20,
          space: 5,
          thickness: 1,
        ),
        textTheme: const TextTheme(
          //HEADING 1
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
          ),

          //HEADING 2
          displayMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),

          //HEADING 3
          displaySmall: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),

          //HEADING 4
          headlineMedium: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),

          // Label 1
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),

          // Label 2
          labelMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),

          // Paragraph 1
          bodyLarge: TextStyle(
            fontSize: 14,
          ),

          // Paragraph 2
          bodyMedium: TextStyle(
            fontSize: 12,
          ),

          // Overline
          labelSmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            letterSpacing: 1,
          ),

          // Caption
          bodySmall: TextStyle(
            fontSize: 10,
          ),
        ).apply(
          displayColor: ColorPalette.neutral,
          bodyColor: ColorPalette.neutral,
          decorationColor: ColorPalette.neutral,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            textStyle: Theme.of(context).textTheme.labelLarge,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
      routes: {
        // ONBOARDING
        SplashScreen.routeName: (_) => const SplashScreen(),
        LoginScreen.routeName: (_) => const LoginScreen(),

        //HOME
        HomeScreen.routeName: (_) => const HomeScreen(),
        CatatanKeuanganScreen.routeName: (_) => const CatatanKeuanganScreen(),

        // PEMBELIAN
        PembelianListScreen.routeName: (_) => const PembelianListScreen(),

        // PENJUALAN
        PenjualanListScreen.routeName: (_) => const PenjualanListScreen()
      },
    );
  }
}
