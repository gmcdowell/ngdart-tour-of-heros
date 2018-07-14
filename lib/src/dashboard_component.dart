import 'package:angular/angular.dart';
import 'dart:async';

import 'package:angular_router/angular_router.dart';

import 'route_paths.dart' as paths;

import 'hero_service.dart';
import 'hero.dart';
import 'hero_search_component.dart';


@Component(
  selector: 'my-dashboard',
  templateUrl: 'dashboard_component.html',
  directives: [coreDirectives, routerDirectives, HeroSearchComponent],
  styleUrls: ['dashboard_component.css'],
)
class DashboardComponent implements OnInit {
  List<Hero> heroes;

  final HeroService _heroService;

  DashboardComponent(this._heroService);

  Future<void> ngOnInit() async {
    heroes = (await _heroService.getAll()).skip(1).take(4).toList();
  }

  String heroUrl(int id) => paths.hero.toUrl(parameters: {paths.idParam: id.toString()});
}
