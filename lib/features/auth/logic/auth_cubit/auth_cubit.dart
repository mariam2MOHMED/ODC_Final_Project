
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odcorange/core/network/remote/endpoints.dart';


import '../../../../core/db/cach_helper/cach_helper.dart';
import '../../../../core/network/remote/dio_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login(String userName, String password) {

    Map<String, String> data = {'username': userName,
      'password': password};    emit(AuthLoginLoading());
    DioHelper.postData(

        url: Endpoints.loginEndPoint, data: data)
        .then((value) {
      if (value.statusCode == 200) {
        CacheHelper.saveData(key: "token", value: value.data["token"]);
        emit(AuthLoginSuccess());
      } else{
        emit(AuthLoginFailure("Login failed , please try again"));
      }

    }).catchError((error){
      emit(AuthLoginFailure(error.toString()));
    });
  }

  void register(String email,String userName, String password) {
    emit(AuthRegisterLoading());
    Map<String, String> data =
    {"username":userName, "password":password,
      "email":email};
    DioHelper.postData(url: Endpoints.signUpEndPoint, data: data)
        .then((value) {
      if (value.statusCode == 200) {
        emit(AuthRegisterSuccess());
      } else{
        emit(AuthRegisterFailure(message:"Register failed , please try again" ));
      }

    }).catchError((error){
      emit(AuthLoginFailure(error.toString()));
    });


  }
}
