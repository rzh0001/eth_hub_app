part of 'app_pages.dart';

abstract class AppRoutes {
  static const home = '/home';

  static const mining = '/mining';
  static const mining_id = '/mining/:id';

  static const bill = '/bill';
  static const bill_id = '/bill/:id';

  static const notFound = '/404';
}
