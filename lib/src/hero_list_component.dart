import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'route_paths.dart' as paths;

import 'hero.dart';
import 'hero_service.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list_component.css'],
  directives: [coreDirectives],
  pipes: [commonPipes],
)
class HeroListComponent implements OnInit {
  final HeroService _heroService;
  final Router _router;

  Hero selected;
  List<Hero> heroes;

  // constructor
  HeroListComponent(this._heroService, this._router);

  void ngOnInit() => _getHeros();

  void onSelect(Hero hero) => selected = hero;

  Future<void> _getHeros() async =>
      heroes = await Future.delayed(Duration(seconds: 1), _heroService.getAll);

  Future<NavigationResult> gotoDetail() =>
      _router.navigate(_heroUrl(selected.id));

  String _heroUrl(int id) =>
      paths.hero.toUrl(parameters: {paths.idParam: id.toString()});

  Future<void> add(String name) async {
    name = name.trim();
    if (name.isEmpty) return null;
    heroes.add(await _heroService.create(name));
    selected = null;
  }

  Future<void> delete(Hero hero) async {
    await _heroService.delete(hero.id);
    heroes.remove(hero);
    if(selected == hero) selected = null;
  }
}
