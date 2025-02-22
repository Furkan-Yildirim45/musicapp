import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:main_app_structure/view/home/home_view.dart';
import 'package:main_app_structure/view/home/menu_view.dart';
import 'package:main_app_structure/view/home/track_detail_view.dart';
import 'package:main_app_structure/view/login/login_view.dart';
import 'package:main_app_structure/view/register/register_view.dart';
import 'package:main_app_structure/view/splash/splash_view.dart';


class NavigatorRoutes {
  static const String init = "/";
  final List<GetPage<dynamic>>? routes = [
    GetPage(name: NavigatorRoutes.init, page: () => const SplashView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
    GetPage(name: NavigateRoutesItems.login.withSlash, page: () => const LoginView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
    GetPage(name: NavigateRoutesItems.register.withSlash, page: () => const RegisterView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
    GetPage(name: NavigateRoutesItems.home.withSlash, page: () => HomeView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
    GetPage(name: NavigateRoutesItems.menu.withSlash, page: () => MenuView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
    GetPage(name: NavigateRoutesItems.trackDetail.withSlash, page: () => TrackDetailView(),transition: Transition.cupertino,transitionDuration: const Duration(milliseconds: 500),curve: Curves.easeInOut),
  ];
}

enum NavigateRoutesItems {
  init,
  splash,
  unknown,
  login,
  register,
  home,
  menu,
  trackDetail,
}

extension NavigateRoutesItemsExtension on NavigateRoutesItems{
  String get withSlash => "/$name";
}