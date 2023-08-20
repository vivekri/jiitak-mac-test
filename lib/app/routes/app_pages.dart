import 'package:get/get.dart';

import '../modules/bussiness/bindings/bussiness_binding.dart';
import '../modules/bussiness/views/bussiness_view.dart';
import '../modules/chat/bindings/chat_binding.dart';
import '../modules/chat/views/chat_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/editprofile/bindings/editprofile_binding.dart';
import '../modules/editprofile/views/editprofile_view.dart';
import '../modules/explore/bindings/explore_binding.dart';
import '../modules/explore/views/explore_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/mypage/bindings/mypage_binding.dart';
import '../modules/mypage/views/mypage_view.dart';
import '../modules/punchin/bindings/punchin_binding.dart';
import '../modules/punchin/views/punchin_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/stamp/bindings/stamp_binding.dart';
import '../modules/stamp/views/stamp_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.DASHBOARD;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE,
      page: () => const ExploreView(),
      binding: ExploreBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.BUSSINESS,
      page: () => const BussinessView(),
      binding: BussinessBinding(),
    ),
    GetPage(
      name: _Paths.PUNCHIN,
      page: () => const PunchinView(),
      binding: PunchinBinding(),
    ),
    GetPage(
      name: _Paths.CHAT,
      page: () => const ChatView(),
      binding: ChatBinding(),
    ),
    GetPage(
      name: _Paths.MYPAGE,
      page: () => const MypageView(),
      binding: MypageBinding(),
    ),
    GetPage(
      name: _Paths.STAMP,
      page: () => const StampView(),
      binding: StampBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
    GetPage(
      name: _Paths.EDITPROFILE,
      page: () => const EditprofileView(),
      binding: EditprofileBinding(),
    ),
  ];
}
