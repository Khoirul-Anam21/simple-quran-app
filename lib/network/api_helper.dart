import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:my_quran/network/exceptions.dart';

class APIBaseHelper {
  final String _baseURL = 'https://api.quran.sutanlab.id/surah/';

  Future<dynamic> getData(String urlQuery) async {
    print('Getting data..  $_baseURL');
    dynamic response;

    try {
      final Response apiResponse = await get(Uri.parse('$_baseURL$urlQuery'));
      print('Accessing... $_baseURL$urlQuery');
      response = _returnResponse(apiResponse);
    } on SocketException {
      print('No internet connection');
      throw FetchDataException('No internet');
    }
    print('Succesfully fetch data');
    return response;
  }
}

dynamic _returnResponse(Response resp) {
  switch (resp.statusCode) {
    case 200:
      dynamic decoder = json.decode(resp.body);
      return decoder;
    case 400:
      throw BadRequestException(resp.body);
    case 401:
    case 403:
      throw UnauthorizedException(resp.body);
    case 500:
    default:
      throw FetchDataException('Error communicating to server');
  }
}
