import 'package:eth_hub_app/pages/404.dart';
import 'package:eth_hub_app/pages/mining/mining_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.mining;

  static final List<GetPage> routes = [
    // 白名单
    // GetPage(
    //   name: AppRoutes.Login,
    //   page: () => LoginView(),
    // ),

    // 我的，需要认证
    // GetPage(
    //   name: AppRoutes.My,
    //   page: () => MyView(),
    //   middlewares: [
    //     RouteAuthMiddleware(priority: 1),
    //   ],
    // ),

    GetPage(
      name: AppRoutes.mining,
      page: () => MiningPage(),
    ),
    GetPage(
      name: AppRoutes.mining_id,
      page: () => MiningPage(),
    ),
  ];

  static final unknownRoute = GetPage(
    name: AppRoutes.notFound,
    page: () => NotfoundView(),
  );
}
