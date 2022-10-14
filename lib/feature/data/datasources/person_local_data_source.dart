// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/error/exception.dart';
import '../models/person_model.dart';

abstract class PersonLocalDataSource{
  // Gets the cached [List<PersonModel>] which was gotten the last time the user had an internet connection.
  // Throws [CacheException] if no cached data is present.


  // to get List of Persons from Cache
  Future<List<PersonModel>>getLastPersonsFromCache();
  // to set the person into Local Storage
  Future<void> personToCache(List<PersonModel> persons);
}


class PersonLocalDataSourceImpl extends PersonLocalDataSource{

  final SharedPreferences sharedPrefs;
  PersonLocalDataSourceImpl({required this.sharedPrefs});

  @override
  Future<List<PersonModel>> getLastPersonsFromCache() {
    final jsonPersonsList =
        sharedPrefs.getStringList('CACHED_PERSONS_LIST'); // read from Ls
    if (jsonPersonsList!.isNotEmpty) {  //if Local storage is not empty
      print('Get Persons from Cache: ${jsonPersonsList.length}');
      return Future.value(jsonPersonsList
          .map((person) => PersonModel.fromJson(json.decode(person)))
          .toList());
    } else { //if Local storage is empty
      throw CacheException();
    }
  }

  @override
  Future<void> personToCache(List<PersonModel> persons) {
    final List<String> jsonPersonsList =
        persons.map((person) => jsonEncode(person.toJson())).toList();

    sharedPrefs.setStringList('CACHED_PERSONS_LIST', jsonPersonsList);
    print('Persons to write Cache: ${jsonPersonsList.length}');
    // ignore: void_checks
    return Future.value(jsonPersonsList);
  }

}