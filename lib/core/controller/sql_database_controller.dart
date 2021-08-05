import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wanderer/core/utils/Database/constants/database_constants.dart';
import 'package:wanderer/core/utils/Database/models/favouritesDBModel.dart';
import 'package:wanderer/modules/home/models/location_data_model.dart';

class SQLDatabaseController extends GetxController {
  static Database? _database;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() async {
    final db = await database;
    db.close();
    super.onClose();
  }

  Future<Database> get database async {
    // if data base exist then will return it else will fetch the database
    if (_database != null) return _database!;
    _database = await _initDB(DataBaseConstants.databaseName);
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    // if the tables are not created then will create athe tables
    return await openDatabase(path, version: 1, onCreate: (db, version) {
      db.execute('''
        CREATE TABLE ${DataBaseConstants.favoritesTableName} (
        ${LocationFields.id} INTEGER PRIMARY KEY,
        ${LocationFields.asciiName} Text NOT NULL,
        ${LocationFields.country} Text NOT NULL,
        ${LocationFields.name} Text NOT NULL,
        ${LocationFields.countryDigraph} Text NOT NULL,
        ${LocationFields.googleMapsLink} Text NOT NULL,
        ${LocationFields.state} Text NOT NULL,
        ${LocationFields.wikipediaLink} Text NOT NULL
        )
        ''');
      db.execute('''
        CREATE TABLE ${DataBaseConstants.bookmarksTableName} (
        ${LocationFields.id} INTEGER PRIMARY KEY,
        ${LocationFields.asciiName} Text NOT NULL,
        ${LocationFields.country} Text NOT NULL,
        ${LocationFields.name} Text NOT NULL,
        ${LocationFields.countryDigraph} Text NOT NULL,
        ${LocationFields.googleMapsLink} Text NOT NULL,
        ${LocationFields.state} Text NOT NULL,
        ${LocationFields.wikipediaLink} Text NOT NULL
        )
        ''');
    });
  }

  addToFavoriteList(LocationDataModel locationData) async {
    // to add a location to list of favorite
    final db = await database;
    final id = await db.insert(
        DataBaseConstants.favoritesTableName, locationData.toJson());
    debugPrint("Id of added location in favourites table is :- $id");
  }

  Future<List<LocationDataModel>> getFavoritePlaceList() async {
    // to fetch list of favorite
    List<LocationDataModel> _favouriteList = [];
    final db = await database;
    var result = await db.query(DataBaseConstants.favoritesTableName);
    result.forEach((element) {
      var place = LocationDataModel.fromJson(element);
      _favouriteList.add(place);
    });
    return _favouriteList;
  }

  addToBookmarkList(LocationDataModel locationData) async {
    // to add a location to list of bookmarks
    final db = await database;
    final id = await db.insert(
        DataBaseConstants.bookmarksTableName, locationData.toJson());
    debugPrint("Id of added location in bookmarks table is :- $id");
  }

  Future<List<LocationDataModel>> getBookmarkPlaceList() async {
    // to fetch list of bookmarks
    List<LocationDataModel> _bookmarkList = [];
    final db = await database;
    var result = await db.query(DataBaseConstants.bookmarksTableName);
    result.forEach((element) {
      var place = LocationDataModel.fromJson(element);
      _bookmarkList.add(place);
    });
    return _bookmarkList;
  }
}
