import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'route_paths.dart' as paths;
import 'hero_list_component.template.dart' as hlct;
import 'dashboard_component.template.dart' as dct;
import 'hero_component.template.dart' as hct;

@Injectable()
class Routes {
  RoutePath get heroes => paths.heroes;
  RoutePath get dashboard => paths.dashboard;

  final List<RouteDefinition> all = [
    RouteDefinition(
      path: paths.heroes.path,
      component: hlct.HeroListComponentNgFactory,
    ),
    RouteDefinition(
        path: paths.dashboard.path,
        component: dct.DashboardComponentNgFactory,
        useAsDefault: true),
    RouteDefinition(
      path: paths.hero.path,
      component: hct.HeroComponentNgFactory,
    ),
  ];
}
