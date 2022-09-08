import 'dart:io';
import 'dart:convert';
import 'package:kinetic/tools.dart';

import 'constants.dart';

Future<Map<String, dynamic>> httpGetRequest(String url) async {
  Map<String, dynamic> resMap = {
    "statusCode":0,
  };

  try {
    HttpClient httpClient = HttpClient();
    httpClient.connectionTimeout = timeoutDuration;
    HttpClientRequest request = await httpClient.getUrl(Uri.parse("https://" + url));

    request.headers.set('content-type', 'application/json');

    HttpClientResponse res = await request.close();
    String reply = await res.transform(utf8.decoder).join();

    httpClient.close();

    if (res.statusCode == 200) {

      var jsonResponse = jsonDecode(reply);
      resMap["response"] = jsonResponse;

    } else {
      safePrint('http.get error: statusCode= ${res.statusCode}');
      safePrint(res.toString());
    }

    resMap["statusCode"] = res.statusCode;

  } catch(e) {
    safePrint(e.toString());
  }

  return resMap;
}

Future<Map<String, dynamic>> httpPostRequest(String url, String data) async {
  Map<String, dynamic> resMap = {
    "statusCode":0,
  };

  try {
    HttpClient httpClient = HttpClient();
    httpClient.connectionTimeout = timeoutDuration;
    HttpClientRequest request = await httpClient.postUrl(Uri.parse("https://" + url));

    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(data));

    HttpClientResponse res = await request.close();
    String reply = await res.transform(utf8.decoder).join();

    httpClient.close();

    if (res.statusCode == 200) {
      safePrint(reply);
    } else {
      safePrint('http.post error: statusCode= ${res.statusCode}');
      safePrint(reply);
    }

    resMap["statusCode"] = res.statusCode;
    resMap["reply"] = reply;

  } catch(e) {
    safePrint(e.toString());
  }

  return resMap;
}