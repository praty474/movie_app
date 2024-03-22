import 'package:movie_app/src/model/base_model.dart';

class itemModel extends BaseModel {
  int? _page;
  int? _total_results;
  int? _total_pages;
  List<_Result> _results =[];
  itemModel.fromJson(Map<String, dynamic>parsedJson){
    print(parsedJson['result'].length
    );
    _page=parsedJson['page'];
  _total_results = parsedJson['total_reults'];
  _total_pages = parsedJson['total_pages'];
  List<_Result> temp = [];
  for(int i =0; i< parsedJson['results'].length; i++)
  {
    _Result result = _Result(parsedJson['results'][i]);
    temp.add(result);
  }

  _results = temp;
  }

  List<_Result> get results => _results;

  int get total_pages => _total_pages;
  int get total_results => _total_results;
  int get page => _page;

}


class _Result{
int ? _vote_count;
int ? _id;
bool ? _video;
var  _vote_average;
String ? title;
double ? _popularity;
String ? _poster_path;
String ? _original_language;
String ? _original_title;
List<int> _genre_ids=[];
String ? _backdrop_path;
bool ? _adult;
String ? _overview;
String ? _release_date;




}

