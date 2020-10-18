import 'package:first_screen/models/Content_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class CategoryContent {
  List<ContentModel> myContent = [];
  Future<void> getContent() async {
    Response response = await get('');
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
    }
  }
}
