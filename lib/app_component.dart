import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/hero_service.dart';
import 'src/routes.dart';

import 'events.dart'; // Event Bus

@Component(
    selector: 'my-app',
    directives: [routerDirectives],
    providers: [
      ClassProvider(
          HeroService), // creates a singleton service available to all components in App
      ClassProvider(Routes),
    ],
    templateUrl: 'app_component.html',
    styleUrls: ['app_component.css'])
class AppComponent {
  final String title = 'Tour of Heros';
  final Routes routes;
  String _eventTitle = 'hello';

  String get eventTitle => _eventTitle;

  AppComponent(this.routes) {
    eventBus.on().listen((event) {
      print(event);
      this._eventTitle = event.text;
    });
  }

  void dashboardClick() {
    print('dashboard');
    eventBus.fire(EventA('dashboard'));
  }

  void heroesClick() {
    eventBus.fire(EventA('hereos'));
  }
}
