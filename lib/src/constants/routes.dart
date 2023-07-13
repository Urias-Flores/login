import 'package:login/src/pages/home.dart';
import 'package:login/src/pages/login.dart';

enum myRoutes{
  login,
  home
}

final routes = {
  myRoutes.login.name: (context) => Login(),
  myRoutes.home.name: (context) => const Home(title: "Welcome")
};