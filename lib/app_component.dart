import 'package:angular/angular.dart';
import 'package:angular_router/angular_router.dart';

import 'src/hero_service.dart';
import 'src/routes.dart';

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
  final title = 'Tour of Heros';
  final Routes routes;

  AppComponent(this.routes);
}
