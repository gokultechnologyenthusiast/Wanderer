import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wanderer/core/utils/constants/constant.dart';
import 'package:wanderer/modules/home/models/location_data_model.dart';

class GetLocationListRepository {
  Future<List<LocationDataModel>> fetchLocationList() async {
    var fullUrl = Uri.parse(Constants.baseUrl + Constants.locationApiPath);
    final response = await http.get(fullUrl);
    Iterable l = json.decode(response.body);
    debugPrint("locaton Array:- ${l.toString()}");
    List<LocationDataModel> locationList = List<LocationDataModel>.from(
        l.map((model) => LocationDataModel.fromJson(model)));

    return locationList;
  }
}
