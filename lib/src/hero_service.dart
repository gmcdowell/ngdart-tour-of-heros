import 'dart:async';
import 'dart:convert';

import 'package:angular/angular.dart';
import 'package:http/http.dart';

import 'hero.dart';
// import 'mock_heros.dart';

@Injectable()
class HeroService {
  static const _heroesUrl = 'api/heroes';

  final Client _http;
  static final _headers = {'Content-Type': 'application/json'};

  HeroService(this._http);

  Future<List<Hero>> getAll() async {
    try {
      final response = await _http.get(_heroesUrl);
      return (_extractData(response) as List)
          .map((json) => Hero.fromJson(json))
          .toList();
    } catch (e) {
      throw _handleError(e);
    }
  }

  dynamic _extractData(Response resp) => json.decode(resp.body)['data'];

  Exception _handleError(dynamic e) {
    print(e);
    return Exception('Server error: cause: $e');
  }

  Future<Hero> get(int id) async {
    try {
      final response = await _http.get('$_heroesUrl/$id');
      return Hero.fromJson(_extractData(response));
    } catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> update(Hero hero) async {
    try {
      final url = '$_heroesUrl/${hero.id}';
      final response =
          await _http.put(url, headers: _headers, body: json.encode(hero));
      return Hero.fromJson(_extractData(response));
    } catch (e) {
      print(e);
      _handleError(e);
    }
  }

  Future<Hero> create(String name) async {
    try {
      final response = await _http.post(_heroesUrl,
          headers: _headers, body: json.encode({'name': name}));
      return Hero.fromJson(_extractData(response));
    } catch (e) {
      print(e);
      _handleError(e);
    }
  }

  Future<void> delete(int id) async {
    try {
      return await _http.delete('$_heroesUrl/$id', headers: _headers);
    } catch (e) {
      print(e);
      _handleError(e);
    }
  }
}
