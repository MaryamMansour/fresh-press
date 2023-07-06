import 'package:http/http.dart';
import 'package:news/screens/home/repo/repo.dart';
import 'package:http/http.dart' as http;

import '../../../../shared/components/constants.dart';

class RemoteRepo extends BaseRepository{
  @override
  Future<Response> getNewsData(String srcID) {
    Uri URL=Uri.https(BASE_URL,"/v2/everything",
        {"apiKey":ApiKey,"sources":srcID
        });
    return http.get(URL);
  }

  @override
  Future<Response> getSources(String category) {
    Uri URL = Uri.https(BASE_URL,"/v2/top-headlines/sources",
        {"apiKey":ApiKey,
          "category":category});
    return http.get(URL);
  }
  
}