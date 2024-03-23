import 'package:movie_app/src/model/base_model.dart';

class ImageModel {
  double? aspect_ratio;
  String? file_path;
  int? height;
  String? iso_639_1;
  double? vote_average;
  int? vote_count;
  int? width;


  ImageModel.fromJson(Map<String, dynamic> parsedJson)
  {
    
  }
}
