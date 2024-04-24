import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../../core/network/network.dart';
import '../../../core/provider/data_provider.dart';

class MainExploreController {
  final BuildContext context;
  MainExploreController(this.context);

  Future<dynamic> getListSymbols() async {
    var dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.setDataSymbols(null);
    final String url = '${network.urlBackend}/api/v3/ticker/bookTicker';
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    try {
      if (response.statusCode == 200) {
        var responseData = json.decode(response.body);
        return responseData;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
