import 'package:angular_router/angular_router.dart';

final heroes = RoutePath(path: 'heroes');
final dashboard = RoutePath(path: 'dashboard');

const idParam = 'id';
final hero = RoutePath(path: '${heroes.path}/:$idParam');

int getId(Map<String, String> parameters) {
  final id = parameters[idParam];
  return id == null ? null : int.tryParse(id);
}
