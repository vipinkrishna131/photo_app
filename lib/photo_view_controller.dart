import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:photo_app/photo_model.dart';
import 'package:get/get.dart';
import 'category.dart';

class PhotoViewController extends GetxController {
  var photoList = <PhotoModel>[];
  var categoryList = <Category>[];
  var isSelected = 0.obs;
  var indexValue = 0.obs;

  @override
  void onInit() {
    fetchCategoryList();
    fetchArmChairList();
    super.onInit();
  }

  void fetchCategoryList() {
    categoryList = [
      Category(image: 'assets/armchair.png', name: 'ArmChair'),
      Category(image: 'assets/bed.png', name: 'Bed'),
      Category(image: 'assets/lamp.png', name: 'Lamp'),
    ];
    // categoryList.value = categoryListNew;
  }

  void fetchArmChairList() {
    photoList = [
      PhotoModel(image: 'assets/chair1.png', name: 'Tortor Chair', price: '256.00', rating: '4.5'),
      PhotoModel(image: 'assets/chair2.png', name: 'Morbi Chair', price: '284.00', rating: '4.8'),
      PhotoModel(image: 'assets/chair3.png', name: 'Pretium Chair', price: '232.00', rating: '4.3'),
      PhotoModel(image: 'assets/chair4.png', name: 'Blandit Chair', price: '224.00', rating: '4.1'),
      PhotoModel(image: 'assets/chair1.png', name: 'Tortor Chair', price: '256.00', rating: '4.5'),
    ];
  }

  void toggleSelection(int index) {
    isSelected.value = index;
  }

  void toggleIndex(int index) {
    indexValue.value = index;
  }
}
