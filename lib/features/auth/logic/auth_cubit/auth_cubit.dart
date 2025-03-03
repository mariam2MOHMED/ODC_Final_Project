
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:odcorange/core/network/remote/endpoints.dart';
import 'package:odcorange/features/auth/data/models/user_model.dart';


import '../../../../core/db/cach_helper/cach_helper.dart';
import '../../../../core/network/remote/dio_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  UserModel? userModel;
  String ?name;
  void login(String userName, String password) {

    Map<String, String> data = {'username': userName,
      'password': password};    emit(AuthLoginLoading());
    DioHelper.postData(

        url: Endpoints.loginEndPoint, data: data)
        .then((value) {
      if (value.statusCode == 200) {
       userModel=UserModel.fromJson(value.data);
       CacheHelper.saveData(key: "token", value:
       value.data["token"]);
       name=userName;
  emit(AuthLoginSuccess());


      } else{
        emit(AuthLoginFailure("Login failed , please try again"));
      }

    }).catchError((error){
      emit(AuthLoginFailure(error.toString()));
    });
  }

  void register(String email,String userName, String password)
  {
 emit(AuthRegisterLoading());
    Map<String, String> data =
    {"username":userName, "password":password,
      "email":email};
    DioHelper.postData(url: Endpoints.signUpEndPoint, data: data)
        .then((value) {
      if (value.statusCode == 200) {
        userModel=UserModel.fromJson(value.data);
        emit(AuthRegisterSuccess());
        // userModel!.name!.firstname!=userName;
        // userModel!.password=password;
      } else{
        emit(AuthRegisterFailure(message:"Register failed , please try again" ));
      }

    }).catchError((error){
      emit(AuthLoginFailure(error.toString()));
    });


  }
void addUser(String email,String name,String phone) async {
    Map<String, dynamic> userData = {
      "email": email,
      "username": name,
      "password": "123",
      "name": {
        "firstname": name,
        "lastname": "Doe"
      },
      "address": {
        "city": "kilcoole",
        "street": "7835 new road",
        "number": 3,
        "zipcode": "12926-3874",
        "geolocation": {
          "lat": "-37.3159",
          "long": "81.1496"
        }
      },
      "phone":phone
    };
    emit(AddUserLoading());
   DioHelper.postData(url: Endpoints.addNewUser,
       data: userData).then((value) {
       if(value.statusCode==200){

         emit(AddUserSuccess());
         print("Add User Sucess");
       }
   }).catchError((error){
     emit(AddUserFailure(error.toString()));
   });
  }

}
