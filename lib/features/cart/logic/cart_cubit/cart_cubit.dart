import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:odcorange/core/db/local_db/local_db.dart';
import 'package:odcorange/core/network/remote/dio_helper.dart';
import 'package:odcorange/features/cart/data/models/product_cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  List<ProductCartModel>carts=[];
  Future<void>  getCart()async{
emit(CartLoading());
try{
 await SQLHelper.getByType("cart").then((value) {
   carts=value.map((e) => ProductCartModel.fromJson(e)).
   toList();
   emit(CartLoaded());
   print(carts[0]);
 }).catchError((error){
   emit(CartFailure(error:  error.toString()));
 });

}catch(e){
  emit(CartFailure(error: "Cart unable to loaded"));
}
  }

}
