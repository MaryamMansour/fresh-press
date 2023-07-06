import 'package:http/http.dart';

abstract class BaseRepository{


  Future<Response> getSources(String category);
  Future<Response> getNewsData(String srcId);
}