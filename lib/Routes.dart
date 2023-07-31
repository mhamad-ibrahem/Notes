import 'package:get/get.dart';
import 'package:notes/Local/modules/add_notes/binding/add_notes_notes.dart';
import 'package:notes/Local/modules/add_notes/view/add_notes_page.dart';
import 'package:notes/Local/modules/login/binding/login_binding.dart';
import 'package:notes/Local/modules/login/view/login.dart';
import 'package:notes/Local/modules/main/view/main_page.dart';
import 'package:notes/Local/modules/otp/binding/otp_binding.dart';
import 'package:notes/Local/modules/otp/view/otp_page.dart';
import 'package:notes/Local/modules/register/binding/register_binding.dart';
import 'package:notes/Local/modules/register/view/register.dart';
import 'Global/Core/Middleware/Middleware.dart';
import 'Local/Core/Constant/Routes.dart';
import 'Local/modules/main/binding/main_binding.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: AppRoute.register,
      page: () => Register(),
      // middlewares: [MiddleWare()],
      transition: Transition.fade,
      binding: RegisterBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
// //=====================Auth=====================
  GetPage(
      name: AppRoute.login,
      page: () => Login(),
      transition: Transition.fade,
      binding: LoginBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.otp,
      page: () => OtpPage(),
      transition: Transition.fade,
      binding: OtpBinding(),
      transitionDuration: const Duration(milliseconds: 700)),

  GetPage(
      name: AppRoute.main,
      page: () => MainPage(),
      transition: Transition.fade,
      binding: MainBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
  GetPage(
      name: AppRoute.addNotes,
      page: () => AddNotesPage(),
      transition: Transition.fade,
      binding: AddNotesBinding(),
      transitionDuration: const Duration(milliseconds: 700)),
];
