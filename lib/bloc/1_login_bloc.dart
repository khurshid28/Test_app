import 'package:dio/dio.dart' as dio;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/bloc/data_state.dart';
import 'package:test_app/core/network/dio_client.dart';

import '../core/endpoints/endpoints.dart';

class LoginBloc extends Cubit<DataState<Map>> {
  DioClient dioClient = DioClient();
  LoginBloc() : super(DataIntial());

  Future postLogin({
    required String password,
    required String email,
  }) async {
    emit(DataWaiting());
    dio.Response response = await dioClient.post(
      Endpoints.login,
      data: {'password': password, 'email': email},
    );

    // print(response.statusCode);
    // print(response.data);

    if (response.statusCode == 200) {
      emit(
        DataSuccess(
          data: {
            "user": response.data["user"],
            "tokens": response.data["tokens"],
          },
        ),
      );
    } else {
      emit(
        DataError(
          error: RequestError(
            statusCode: response.statusCode,
            message: response.statusMessage,
          ),
        ),
      );
    }

    return response.data;
  }
}
