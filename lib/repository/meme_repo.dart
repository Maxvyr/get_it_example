import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get_it_tutorial/domain/models/meme.dart';
import 'package:http/http.dart' as http;

class MemeRepo {
  Future<Meme> getMeme() async {
    final http.Response response = await http.get(
      Uri.parse("https://some-random-api.ml/animal/raccoon"),
    );
    debugPrint(response.statusCode.toString());
    debugPrint(response.body);
    final Map<String, dynamic> singleMemeJson = jsonDecode(response.body);
    // return Meme.fromJson(singleMemeJson);
    return compute(Meme.fromJson, singleMemeJson);
  }
}
