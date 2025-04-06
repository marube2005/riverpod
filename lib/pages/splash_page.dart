import 'package:flutter/material.dart';
//packages
import 'package:firebase_core/firebase_core.dart'; //connects my app to firebase.
import 'package:get_it/get_it.dart';
//services
import '../services/navigation_service.dart';
import '../services/media_services.dart';
import '../services/cloud_storage_service.dart';
import '../services/database_services.dart';

//pages

class SplashPage extends StatefulWidget {
  final VoidCallback onInitializationComplete;

  const SplashPage({required Key key, required this.onInitializationComplete})
      : super(key: key);

  @override
  //creation phase of a widget. Called when a new instance of a StatefulWidget is created.
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  //initialization phase. 
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4)).then((_) {
      _setup().then(
        (_) => widget.onInitializationComplete(),
      );
    });
  }

  @override
  //Ui building phase. Called everyTime the widget is rebuild
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ('My Chatify App'),
      navigatorKey: NavigationService.navigatorKey,
      theme: ThemeData(
        dialogBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
        scaffoldBackgroundColor: Color.fromRGBO(36, 35, 49, 1.0),
      ),
      routes: {
        // '/home': (context) => HomeScreen(),
        // '/chats':(chats) => Chats(),
      },
      home: Scaffold(
        body: Center(
          child: Container(
            height: 250,
            width: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage('assets/images/image.png')),
            ),
          ),
        ),
      ),
    );
  }

  //Connects my app to firebase
  Future<void> _setup() async {
    WidgetsFlutterBinding
        .ensureInitialized(); //ensures flutter engine is ready.Handles some specific tasks.
    await Firebase.initializeApp();
    _registerServices();
  }

  //first service which will be offere to register users
  void _registerServices() {
    GetIt.instance.registerSingleton<NavigationService>(NavigationService());
    GetIt.instance.registerSingleton<MediaServices>(MediaServices());
    GetIt.instance
        .registerSingleton<CloudStorageService>(CloudStorageService());
    GetIt.instance.registerSingleton<DatabaseServices>(DatabaseServices());
  }
}
