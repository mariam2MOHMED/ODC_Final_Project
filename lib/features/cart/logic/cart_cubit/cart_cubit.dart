import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:odcorange/core/db/local_db/local_db.dart';
import 'package:odcorange/core/network/remote/dio_helper.dart';
import 'package:odcorange/features/cart/data/models/product_cart_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  double totalPrice=0;
  int cntOfItem=1;
  int?quatityItem=1;
  List<ProductCartModel>carts=[];
  ProductCartModel? cartModel;
  // Future<void>  initQuantity()async{
  //   for(var car in carts){
  //     quatityItem=   car.quantity;
  //   }
  //   emit(CartInitQuantity());
  // }
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
  Future<void>  deleteCart(String id,int index)async{
    emit(CartDeleteLoading());
    try{
      await SQLHelper.deleteCategory(id, "cart");
      carts.removeAt(index);
      calculateTotalPrice();
      emit(CartDeleteLoaded());
    }catch(error){
      print("the error in cart is ${error.toString()}");
      emit(CartFailure(error: "the error in cart"));
    }
  }
  void increaseQuantity(int index) {
    if (index >= 0 && index < carts.length) {
     cntOfItem=carts[index].quantity!;
     cntOfItem++;
      carts[index].quantity = (carts[index].quantity ?? 0) + 1;
      emit(AddItem()); // Notify UI about the update
    }
    calculateTotalPrice();
  }

  void decreaseQuantity(int index) {
    if (index >= 0 && index < carts.length &&
        (carts[index].quantity ?? 0) > 1) {
       cntOfItem=carts[index].quantity!;
      cntOfItem--;
      carts[index].quantity = (carts[index].quantity ?? 1) - 1;
      emit(MinusItem());
    }    calculateTotalPrice();
  }


  calculateTotalPrice(){
    totalPrice = 0;
    for(int i=0;i<carts.length;i++){
      totalPrice+=carts[i].quantity!
          *carts[i].price!.toDouble();
    }
    emit(CalculateTotalPrice());
  }

}
