import 'package:flutter/material.dart';

class NavigationService {
  //NavigationService, the GlobalKey<NavigatorState> is used to manage navigation without needing a BuildContext
  static GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  void removeAndNavigateToRoute(String _route){
     navigatorKey.currentState?.popAndPushNamed(_route);
  }

  void navigateToRoute(String _route){
    navigatorKey.currentState?.pushNamed(_route);
  }

  void navigateToPage(Widget _widgetName){
    navigatorKey.currentState?.push(MaterialPageRoute(
       builder: (BuildContext _context){
        return _widgetName;
       }
    ));
  }

  void goBack() {
    navigatorKey.currentState?.pop();
  }
}

//Why Use a GlobalKey<NavigatorState>?
//In your NavigationService, the GlobalKey<NavigatorState> is used to manage navigation without needing a BuildContext. Normally, Navigator.push() requires a BuildContext, which is only available within a widget's build method. However, with a GlobalKey<NavigatorState>, you can:

//✅ Navigate from anywhere in the app, even outside the widget tree.✅ Access the NavigatorState directly to perform push, pop, and replace operations.
//✅ Maintain navigation functionality in services, managers, or controllers without passing BuildContext everywhere.