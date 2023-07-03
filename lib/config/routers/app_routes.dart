import 'package:flutter/material.dart';
import 'package:quote/core/utils/app_strings.dart';
import 'package:quote/features/random_quote/presentation/screens/quote_screen.dart';
import '../../features/random_quote/presentation/screens/favquote_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String favQuoteRoute = '/favQuote';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(
          builder: (context) => const QuoteScreen(),
        );
      case Routes.favQuoteRoute:
        return MaterialPageRoute(builder: (context) => const FavQuoteScreen());
      default:
        return null;
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
        builder: (context) => const Scaffold(
              body: Text(AppStrings.noRouteFound),
            ));
  }
}
