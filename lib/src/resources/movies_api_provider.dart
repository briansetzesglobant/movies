import 'dart:async';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import 'dart:convert';
import '../models/item_model.dart';

class MoviesApiProvider {
  http.Client client = http.Client();

  Future<ItemModel> fetchMoviesList() async {
    final _response = await client.get(
      Uri.parse(
        Constants.uriClient,
      ),
    );
    if (_response.statusCode == Constants.status) {
      return ItemModel.fromJson(json.decode(
        _response.body,
      ));
    } else {
      throw Exception(
        Constants.error,
      );
    }
  }
}
