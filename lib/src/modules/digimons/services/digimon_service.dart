
import 'package:digiapi/src/core/constants/api_route.dart';
import 'package:digiapi/src/core/models/digimon.dart';
import 'package:dio/dio.dart';

class DigimonService {
  final _dio = Dio();

  Future<List<Digimon>> getDigimons(int page) async {
    try {
      final response = await _dio.get(ApiRoute.baseUrl+'?pageSize=10?%3Fpage%3D6&page=$page');
      final List<dynamic> digimonArray = response.data['content'];
      final List<Digimon> digimonList = [];

      for (var digimonData in digimonArray) {
        final Digimon digimon = await _fetchDigimonDetails(digimonData['href']);
        digimonList.add(digimon);
      }

      return digimonList;
    } catch (error) {
      rethrow;
    }
  }

  Future<Digimon> _fetchDigimonDetails(String href) async {
    try {
      final response = await _dio.get(href);
      final Map<String, dynamic> digimonData = response.data;

      // Convert the individual digimon details into a Digimon object
      final Digimon digimon = Digimon.fromJson(digimonData);

      return digimon;
    } catch (error) {
      // Handle errors appropriately, e.g., logging or rethrowing
      print('Error fetching digimon details: $error');
      rethrow;
    }
  }
}
