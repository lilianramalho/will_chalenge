import 'package:get/state_manager.dart';
import 'package:will_challenge/model/category/category.dart';
import 'package:will_challenge/repository/repository.dart';

class CategoryController extends GetxController {
  final Repository _repository = Repository();
  List<Category>? listCategory;
  RxBool isLoarding = false.obs;

  getCategories() async {
    isLoarding.value = true;
    Map<String, dynamic> result = await _repository.getCategories();
    listCategory = result['categories']
        .map<Category>((category) {
          return Category.fromJson(category);
        })
        .cast<Category>()
        .toList();
    isLoarding.value = false;
  }
}
