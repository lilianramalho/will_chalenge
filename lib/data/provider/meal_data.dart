import 'package:dio/dio.dart';

class MealData {
  Dio dio = Dio();

  Future<Map<String, dynamic>> getMeals(String category) async {
    final response = await dio
        .get('https://www.themealdb.com/api/json/v1/1/filter.php?c=$category');
    if (response.statusCode == 200) {
      print(response.data['meals']);
      return response.data;
    } else {
      return {'error': 'falha na comunicação com o servidor!'};
    }
  }
}
