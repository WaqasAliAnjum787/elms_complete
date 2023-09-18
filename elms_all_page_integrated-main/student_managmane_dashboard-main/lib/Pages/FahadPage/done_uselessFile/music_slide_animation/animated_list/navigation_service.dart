
// import 'package:get_it/get_it.dart';

// GetIt locator = GetIt.instance;

// void initServicesLocator() {
//   locator.registerSingleton<NavigationService>(NavigationService());
// }

// class NavigationService {
//   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
//   late HeroController heroController;

//   // constructor
//   NavigationService() {
//     heroController = HeroController(createRectTween: _createRectTween);
//   }

//   // This is the only method that is called from the UI
//   void navigateTo(NavigationArguments args) {
//     navigatorKey.currentState!.pushNamed('', arguments: args);
//   }

//   RectTween _createRectTween(Rect? begin, Rect? end) {
//     // check the biggest rect and return as begin and end
//     return MaterialRectArcTween(begin: begin, end: end);
//   }
// }

// class NavigationArguments {
//   final int coffee;
//   final int? treat;
//   final bool isSweetTreats;
//   final bool isCheckout;
//   NavigationArguments(
//       {required this.coffee,
//       this.treat,
//       this.isSweetTreats = false,
//       this.isCheckout = false});
// }
