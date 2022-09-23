import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:vectracom_test/models/get_posts_model.dart';

class ApiService{

  Future<List<GetPostsModel>> getPostsFromApi()async{
    List<GetPostsModel> getPostsModelList = <GetPostsModel>[];
    var users = Uri.parse('https://zoo-animal-api.herokuapp.com/animals/rand/10');
    var response = await http.get(users);
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      for(var da in data){
        getPostsModelList.add(GetPostsModel.fromJson(da));
      }
    }
    return getPostsModelList;
  }

}