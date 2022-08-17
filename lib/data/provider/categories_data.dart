import 'package:dio/dio.dart';

class CategoryData {
  Dio dio = Dio();

  Future<Map<String, dynamic>> getCategories() async {
    final response =
        await dio.get('https://www.themealdb.com/api/json/v1/1/categories.php');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      return {'error': 'falha na comunicação com o servidor!'};
    }
  }
}
