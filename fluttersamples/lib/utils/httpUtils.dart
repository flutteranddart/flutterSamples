/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:28:49 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:28:49 
 */
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'dart:convert';

class HttpUtils {
  postHttpClient() async {
    var url = "http://192.168.1.130:8092/a/r";
    var httpClient = new HttpClient();
    httpClient.postUrl(Uri.parse(url)).then((HttpClientRequest request) {
      // Optionally set up headers...
      // Optionally write to the request object...
      // Then call close.
      request.headers.contentType =
          //name='value1'&pwd='value2'
          // ContentType("application", "x-www-form-urlencoded");
          ContentType("application", "json");
      request.write("{\"name\":\"value1\",\"pwd\":\"value2\"}");
      return request.close();
    }).then((HttpClientResponse response) {
      // Process the response.
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      } else {
        print("error");
      }
    });
  }

  postHttpEncodeClient() async {
    var url = "http://192.168.1.130:8092/a/ap";
    var client = new http.Client();
    Map<String, String> headers = new Map();
    headers["content-type"] = "application/x-www-form-urlencoded";
    Map<String, String> bodyParams = new Map();
    bodyParams["name"] = "value1";
    bodyParams["pwd"] = "value2";
    client
        .post(url, headers: headers, body: bodyParams, encoding: Utf8Codec())
        .then((http.Response response) {
      if (response.statusCode == 200) {
        print(response.body);
      }
    }).catchError((error) {});
  }

  postHttpJsonClient() async {
    var url = "http://192.168.1.130:8092/a/ap";
    var client = new http.Client();
    Map<String, String> headers = new Map();
    headers["content-type"] = ContentType.json.toString();
    Map<String, String> bodyParams = new Map();
    bodyParams["name"] = "value1";
    bodyParams["pwd"] = "value2";
    client
        .post(url,
            headers: headers,
            body: jsonEncode(bodyParams),
            encoding: Utf8Codec())
        .then((http.Response response) {
      if (response.statusCode == 200) {
        print(response.body);
      }
    }).catchError((error) {});
  }

  postHttpFormDataClient() async {
    var url = "http://192.168.1.130:8086/entity/formReq";
    var client = new http.MultipartRequest("post", Uri.parse(url));
    client.fields["name"] = "value1";
    client.fields["pwd"] = "value2";
    client.send().then((http.StreamedResponse response) {
      if (response.statusCode == 200) {
        response.stream.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      }
    }).catchError((error) {});
  }

  postHttpFileClient() async {
    var url = "http://192.168.1.130:8086/entity/upReq";
    var client = new http.MultipartRequest("post", Uri.parse(url));
    http.MultipartFile.fromPath('file', 'sdcard/img.png',
            filename: 'img.png', contentType: MediaType('image', 'png'))
        .then((http.MultipartFile file) {
      client.files.add(file);
      client.fields["description"] = "descriptiondescription";
      client.send().then((http.StreamedResponse response) {
        if (response.statusCode == 200) {
          response.stream.transform(utf8.decoder).join().then((String string) {
            print(string);
          });
        } else {
          response.stream.transform(utf8.decoder).join().then((String string) {
            print(string);
          });
        }
      }).catchError((error) {
        print(error);
      });
    });
  }

  getHttpClient() async {
    var url = "http://192.168.1.130:8086/entity/formReq";
    var httpClient = new HttpClient();
    httpClient.getUrl(Uri.parse(url)).then((HttpClientRequest request) {
      // Optionally set up headers...
      // Optionally write to the request object...
      // Then call close.
      return request.close();
    }).then((HttpClientResponse response) {
      // Process the response.
      if (response.statusCode == 200) {
        response.transform(utf8.decoder).join().then((String string) {
          print(string);
        });
      } else {
        print("error");
      }
    });
  }
}
