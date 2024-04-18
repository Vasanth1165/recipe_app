import 'package:get/get.dart';

class WishListController extends GetxController{
  RxList wishItems=[].obs;

  void addToWishList(String itemId){
    if(!wishItems.contains(itemId)){
      wishItems.add(itemId);
    }else{
      wishItems.remove(itemId);
    }
    print(wishItems);
  }

  bool isinWishlist(String itemId){
    if(wishItems.contains(itemId)){
      return true;
    }else{
      return false;
    }
  }
}