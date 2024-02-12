import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:task/core/constant/app_strings.dart';
import 'package:task/core/local/storage.dart';

import '../local/TokenUtil.dart';

class ApiClient {
  static Map<String, String> headers() {
    var mHeaders = {
      HttpHeaders.acceptHeader: 'application/json',
      HttpHeaders.contentTypeHeader: 'application/jsons',
    };
    // mHeaders["Authorization"] = 'Bearer ${TokenUtil.getTokenFromMemory()}';
    mHeaders["Authorization"] = 'Bearer 110|e0M0XTpejQxHKBNp9eC8VWEfaQicKZ4RQSzVmy6la346e98e';
    mHeaders["Accept-Language"] = getValue(AppString.locale) ?? 'ar';
    return mHeaders;
  }

  static Map<String, String> putHeaders() {
    var mHeaders = {
      HttpHeaders.acceptHeader: 'application/json',
    };
    mHeaders["Authorization"] = 'Bearer ${TokenUtil.getTokenFromMemory()}';
    mHeaders["Accept-Language"] = getValue(AppString.locale) ?? 'ar';
    return mHeaders;
  }

  //get
  static Future<http.Response> getRequest(String endPoint, {Map<String, dynamic>? queryParams}) async {
    Uri baseUrl = Uri.parse(AppString.baseUrl);

    Uri url = Uri(scheme: baseUrl.scheme, host: baseUrl.host, path: endPoint, queryParameters: queryParams);
    log("$url\n${headers()}");
    if (queryParams != null) log("$queryParams");
    final response = await http.get(url, headers: headers());
    return response;
  }

  // delete
  static Future<http.Response> deleteRequest(String endPoint, {Map<String, dynamic>? queryParams}) async {
    Uri baseUrl = Uri.parse(AppString.baseUrl);
    Uri url = Uri(
      scheme: baseUrl.scheme,
      host: baseUrl.host,
      path: endPoint,
      queryParameters: queryParams,
    );
    log("$url\n${headers()}");
    log(url.queryParameters.toString());
    final response = await http.delete(url, headers: headers());
    return response;
  }

// put
  static Future<http.Response> putRequest(String endPoint, dynamic requestBody,
      {bool isMultipart = false, List<http.MultipartFile>? multiPartValues}) async {
    String url = AppString.baseUrl + endPoint;
    log("$url\n${putHeaders()}");
    if (requestBody != null) log(requestBody.toString());
    http.Response response;
    if (!isMultipart) {
      log("*NotMultipart*");
      response = await http.put(Uri.parse(url), headers: headers(), body: jsonEncode(requestBody));
    } else {
      log("*isMultipart*");
      var uri = Uri.parse(url);
      Map<String, String> convertedMap = {};
      requestBody.forEach((key, value) {
        convertedMap[key] = value;
      });
      var request = http.MultipartRequest('PUT', uri)
        ..headers.addAll(putHeaders())
        ..fields.addAll(convertedMap)
        ..files.addAll(multiPartValues!);
      response = await http.Response.fromStream(await request.send());
    }
    return response;
  }

  //post
  static Future<http.Response> postRequest(String endPoint, dynamic requestBody,
      {bool isMultipart = false, List<http.MultipartFile>? filesMap}) async {
    String url = AppString.baseUrl + endPoint;
    log("$url\n${headers()}");
    if (requestBody != null) log(requestBody.toString());
    http.Response response;
    if (!isMultipart) {
      log("*NotMultipart*");
      response = await http.post(Uri.parse(url), headers: headers(), body: jsonEncode(requestBody));
    } else {
      log("*isMultipart*");
      var uri = Uri.parse(url);
      Map<String, String> convertedMap = {};
      requestBody.forEach((key, value) {
        convertedMap[key] = value;
      });
      var request = http.MultipartRequest('POST', uri)
        ..headers.addAll(headers())
        ..fields.addAll(convertedMap)
        ..files.addAll(filesMap!);
      response = await http.Response.fromStream(await request.send());
    }
    return response;
  }
}
