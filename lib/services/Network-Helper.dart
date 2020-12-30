import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:io';

class NetworkHelper {
  NetworkHelper({this.url,this.data});
  final url;
  final data;

  Future sendData() async{
    try{

      http.Response response = await http.post(
          url,body: data);

      if(response.statusCode==200)
      {
        print("response is ${response.body}");
        var userinfo = convert.jsonDecode(response.body);
        return {"user":userinfo};

      }
      else {
        print('Request failed with status: ${response.statusCode}.');
        return 3;
      }


    }catch(e){
      print(e);
      return 3;
    }

  }
  Future getData() async{
    http.Response response = await http.get(
        url,headers:data);
    print(response.body);
    if(response.statusCode==200)
    {
      var clinics= convert.jsonDecode(response.body);
      return clinics;
    }
    else {
      print('Request failed with status:${response.statusCode}.');
      return 3;
    }
  }
}