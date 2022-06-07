import 'package:dio/dio.dart';
import 'package:flutter_shared/mixins/constant/constant.dart';
import 'package:flutter_shared/mixins/network/error_handling.dart';
import 'package:flutter_shared/mixins/network/interceptor.dart';
import 'package:flutter_shared/model/res/character_res.dart';

import '../mixins/logger.dart';

class CharacterProvider {
  late Dio _dio;

  CharacterProvider(){
    BaseOptions options  =
    BaseOptions(
        baseUrl: kUrlAPI,
        receiveTimeout: 15000,
        connectTimeout: kConnectionTimeout
    );
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());
  }

  Future<CharacterRes> getCharacter(int page,{
    String name="",
    String status="",
    String gender="",
    String species=""
  }) async {
    try{
      final response = await _dio.get(
        '/character',
        queryParameters: {
          'page':'$page',
          'name':name,
          'status':status,
          'species':species,
          'gender':gender
        },
      );
      if(response.data!=null){
        return CharacterRes.fromJson(response.data);
      }
      return Future.error(ErrorHandling(response.data));
    } catch (err, s) {
      logger.e("getCharacter",err,s);
      if(err is DioError){
        return Future.error(ErrorHandling(err.response));
      }
      return Future.error(ErrorHandling(err));
    }
  }


}