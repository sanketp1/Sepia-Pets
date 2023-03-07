import 'dart:convert';
import 'dart:io';

import 'package:sepia_pets/data/network/baseApiService.dart';
import 'package:http/http.dart' as http;
import '../appException.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getApiResponse(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http.get(Uri.parse(url));
    } on SocketException {
      throw FetchDataException("Not connected to internet");
    }

    return jsonResponse;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = json.decode(response.body);
        return jsonResponse;
      case 400:
        throw BadRequestException("Invalid request");
    default:
        throw FetchDataException("An error occured during fetching data");

    }
  }
}
