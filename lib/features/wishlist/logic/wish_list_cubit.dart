import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:odcorange/core/db/local_db/local_db.dart';
import 'package:odcorange/features/cart/data/models/product_cart_model.dart';
import 'package:odcorange/features/wishlist/data/models/product_wish_model.dart';

part 'wish_list_state.dart';

class WishListCubit extends Cubit<WishListState> {
  WishListCubit() : super(WishListInitial());
  List<ProductWishModel>wishlist=[];

  Future<void>getWishlist()async{
    emit(WishListLoading());
    try{
     await SQLHelper.getByType("wishlist").then((value) {
       wishlist = value .map((e) => ProductWishModel.
       fromJson(e)).toList();
     });
     emit(WishListLoaded());
     //wishlist.removeRange(0, wishlist.length-1);
    }
    catch(error){
      emit(WishListFailure(error: error.toString()));
      print("the error in the wishlist is ${error}");
    }
  }


}
