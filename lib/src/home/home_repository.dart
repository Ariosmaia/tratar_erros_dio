import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:tratar_erros_dio/src/shared/custom_dio/custom.dio.dart';
import 'package:tratar_erros_dio/src/shared/models/post_model.dart';

class HomeRepository extends Disposable {
  //dispose will be called automatically by closing its streams

  final CustomDio _client;

  HomeRepository(this._client);

  Future<List<PostModel>> getPosts() async {
    try {
      var response = await _client.dio.get("/posts");
      return (response.data as List)
          .map((item) => PostModel.fromJson(item))
          .toList();
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<int> createPost(Map<String, dynamic> data) async {
    try {
      var response = await _client.dio.post("/posts", data: data);
      return response.statusCode;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  Future<int> updatePost(Map<String, dynamic> data, int id) async {
    try {
      var response = await _client.dio.put("/posts/$id", data: data);
      return response.statusCode;
    } on DioError catch (e) {
      throw (e.message);
    }
  }

  /* Future<int> updatePost(Map<String, dynamic> data, int id) async {
    try {
      var response = await _client.dio.patch("/posts/$id", data: data);
      return response.statusCode;
    } on DioError catch (e) {
      throw (e.message);
    }
  } */
  
  @override
  void dispose() {}
}

//CREATE -> POST
//READ  -> GET
//UPDATE
//DELET

