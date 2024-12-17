import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:story_space/core/data/network/api_service.dart';
import 'package:story_space/core/data/network/model/base_response.dart';
import 'package:story_space/core/data/network/model/login_response.dart';
import 'package:story_space/core/data/network/model/story_detail_response.dart';
import 'package:story_space/core/data/network/model/story_response.dart';
import 'package:story_space/core/data/preferences/user_prefenrece.dart';
import 'package:story_space/core/data/util/compressor_image.dart';
import 'package:story_space/core/data/util/logger.dart';

class HttpApiService implements ApiService {
  static HttpApiService? _httpApiService;

  HttpApiService._internal() {
    _httpApiService = this;
  }

  factory HttpApiService() => _httpApiService ?? HttpApiService._internal();

  Future<String> getToken() async {
    final token = (await UserPrefenrece.getUser())?.token;
    if (token == null) {
      throw Exception('Token not found.');
    }
    return token;
  }

  @override
  Future<Either<Exception, ListStoriesResponse>> getStories({
    int page = ApiService.initialPage,
    int size = ApiService.pageSize,
    int location = ApiService.withLocation,
  }) async {
    Logger.log('getStories');
    return makeRequest(() async {
      final uri = Uri.parse(
          "${ApiService.baseUrl}stories?page=$page&location=$location&size=$size");
      final http.Response response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer ${await getToken()}',
        },
      );
      final body = response.body;
      Logger.log(body);
      return ListStoriesResponse.fromJsonString(body);
    });
  }

  @override
  Future<Either<Exception, LoginResponse>> login(
    String email,
    String password,
  ) async {
    Logger.log('login name: $email, email: $password');
    return await makeRequest(() async {
      final uri = Uri.parse("${ApiService.baseUrl}login");
      final http.Response response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      Logger.log(response.body);
      return LoginResponse.fromJsonString(response.body);
    });
  }

  @override
  Future<Either<Exception, BaseResponse>> register(
    String name,
    String email,
    String password,
  ) async {
    Logger.log('register name: $name, email: $email, password: $password');
    return await makeRequest(() async {
      final uri = Uri.parse("${ApiService.baseUrl}register");
      final http.Response response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
          'password': password,
          'name': name,
        }),
      );
      Logger.log(response.body);
      return BaseResponse.fromJsonString(response.body);
    });
  }

  @override
  Future<Either<Exception, BaseResponse>> addNewStory(
      String description, File file,
      {double? lat, double? lon}) async {
    Logger.log(
        'addNewStory description: $description, photo: ${basename(file.path)} lat: $lat, lon: $lon');
    return await makeRequest(() async {
      final uri = Uri.parse("${ApiService.baseUrl}stories");

      final request = http.MultipartRequest('POST', uri);
      final bytes =
          await CompressorImage.compressImage(await file.readAsBytes());
      final multiPartFile = http.MultipartFile.fromBytes(
        'photo',
        bytes,
        filename: basename(file.path),
      );
      final Map<String, String> fields = {
        'description': description,
        'lat': lat != null ? lat.toString() : (0.0).toString(),
        'lon': lon != null ? lon.toString() : (0.0).toString(),
      };
      final Map<String, String> headers = {
        'Content-Type': "multipart/form-data",
        'Authorization': 'Bearer ${await getToken()}',
      };

      request.files.add(multiPartFile);
      request.fields.addAll(fields);
      request.headers.addAll(headers);

      final http.StreamedResponse streamedResponse = await request.send();
      final Uint8List responseList = await streamedResponse.stream.toBytes();
      final String responseData = String.fromCharCodes(responseList);
      Logger.log(responseData);
      return BaseResponse.fromJsonString(responseData);
    });
  }

  @override
  Future<Either<Exception, StoryDetailResponse>> getStoryDetail(
      String id) async {
    Logger.log('getStoryDetail');
    return await makeRequest(() async {
      final uri = Uri.parse("${ApiService.baseUrl}stories/$id");
      final http.Response response = await http.get(
        uri,
        headers: {
          'Authorization': 'Bearer ${await getToken()}',
        },
      );
      final body = response.body;
      Logger.log(body);
      return StoryDetailResponse.fromJsonString(body);
    });
  }

  Future<Either<Exception, T>> makeRequest<T>(
    Future<T> Function() block,
  ) async {
    try {
      return Either.right(await block());
    } on SocketException catch (e) {
      debugPrint('SocketException; $e');
      return Either.left(e);
    } on HttpException catch (e) {
      debugPrint('HttpException; $e');
      return Either.left(e);
    } on http.ClientException catch (e) {
      debugPrint('ClientException; $e');
      return Either.left(e);
    } on Exception catch (e) {
      debugPrint('Exception; $e');
      return Either.left(e);
    }
  }
}
