import 'package:shop/view/screen/Home/search_screen.dart';
import 'package:shop/view/screen/drawer/about_us.dart';
import 'package:shop/view/screen/drawer/favorite.dart';
import 'package:shop/view/screen/drawer/privacy.dart';
import 'package:shop/view/screen/order/cart_screen.dart';
import 'package:shop/view/screen/order/error_screen.dart';

import 'package:shop/view/screen/order_history/location.dart';
import 'package:shop/view/screen/order/item_card_screen.dart';
import 'package:shop/view/screen/order/sub_category_screen.dart';
import 'package:shop/view/screen/order/thx_for_order.dart';
import 'package:shop/view/screen/order_history/deatils_screen.dart';
import 'package:shop/view/screen/order_history/order_history_screen.dart';
import 'package:shop/view/screen/order_history/progress_screen.dart';
import 'package:shop/view/screen/drawer/my_locations_screen.dart';
import 'package:shop/view/screen/view_all_screen.dart';

import 'view/screen/Home/home.dart';
import 'view/screen/auth/forgetpassword/forgetpassword.dart';
import 'view/screen/auth/forgetpassword/resetpassword.dart';
import 'view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'view/screen/auth/forgetpassword/verifycode.dart';
import 'view/screen/auth/login.dart';
import 'view/screen/auth/signup.dart';
import 'view/screen/auth/success_signup.dart';
import 'view/screen/auth/verifycodesignup.dart';
import 'view/screen/onboarding.dart';
import 'package:get/get.dart';
import 'core/constant/routes.dart';

List<GetPage> routes = [
  // GetPage(name: "/", page: () => const Language(),middlewares: [
  //   MyMiddleware()
  // ]),
  GetPage(name: "/", page: () => const Home()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(
      name: AppRoute.forgetPassword,
      page: () => const ForgetPassword(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.verifyCode,
      page: () => const VerifyCode(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.verifyCodeSingUp,
      page: () => const VerifyCodeSignUp(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.resetPassword,
      page: () => const ResetPassword(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(
      name: AppRoute.successSignUp,
      page: () => const SuccessSignUp(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.onBoarding,
      page: () => const OnBoarding(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.home,
      page: () => const Home(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.orderHistoryScreen,
      page: () => const OrderHistoryScreen()),
  GetPage(
      name: AppRoute.cartScreen,
      page: () => const CartScreen(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.subCategoryScreen,
      page: () => const SubCategoryScreen(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.errorScreen,
      page: () => const ErrorScreen(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.thxForOrder,
      page: () => const ThxForOrder(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.viewAll,
      page: () => const ViewAllScreen(),
      transition: Transition.fadeIn),
  // order
  GetPage(
      name: AppRoute.locationScreen,
      page: () => const LocationScreen(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.progressScreen,
      page: () => const ProgressScreen(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.detailsScreen,
      page: () => const DetailsScreen(),
      transition: Transition.fadeIn),

  // Drawer
  GetPage(
      name: AppRoute.favorite,
      page: () => const FavoriteScreen(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.myLocation,
      page: () => const MyLocationsScreen(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.aboutUs,
      page: () => const AboutUsScreen(),
      transition: Transition.fadeIn),
  GetPage(
      name: AppRoute.privacy,
      page: () => const PrivacyScreen(),
      transition: Transition.fadeIn),

  // item card screen
  GetPage(
      name: AppRoute.itemCardScreen,
      page: () => const ItemCardScreen(),
      transition: Transition.fadeIn),
  // search screen
  GetPage(
      name: AppRoute.searchScreen,
      page: () => const SearchScreen(),
      transition: Transition.fadeIn),
];
