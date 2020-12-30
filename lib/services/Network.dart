import 'Network-Helper.dart';
import 'package:clinic_app/utilities/constant.dart';



class Network {
//  Future<dynamic> sendUserData(String name, String pass) async {
//    String url = "$web/login_app.php"
//        "?name=$name&password=$pass";
//    var response;
//    try {
//      response = await http.get(url);
//      if (response.statusCode == 200) {
//        var jsonResponse = convert.jsonDecode(response.body);
//        print(jsonResponse);
//        return jsonResponse;
//      } else {
//        print('Request failed with status: ${response.statusCode}.');
//        return 3;
//      }
//    } on SocketException catch (_) {
//      print("Error Happend");
//      print(response);
//      return 3;
//    }
//  }
//}

  Future<dynamic> sendUserData(String name, String pass) async {
    NetworkHelper networkhelper = NetworkHelper(
        url: '$web/login_app.php', data: {"name": name, "password": pass});
    var userdata = await networkhelper.sendData();

    return userdata;

  }

  Future<dynamic> sendUserData1(
      String name, String pass, String pass1, int age, int sex) async {
    NetworkHelper networkhelper = NetworkHelper(url: '$web/sign_up.php', data: {
      "name": name,
      "password": pass,
      "password1": pass1,
      "age": '$age',
      "sex": '$sex'
    });
    var userdata = await networkhelper.sendData();
    return userdata;
  }

  Future<dynamic> sendfavoritData(
      String name, String image, int clinic_id,int id) async {
    NetworkHelper networkhelper = NetworkHelper(
        url: '$web/favorit.php',
        data: {"name": name, "image": image, "clinic_id": '$clinic_id',"user_id": '$id'});
    var userdata = await networkhelper.sendData();
    return userdata;
  }
  Future<dynamic> sendcomment(
      String comment, int user_id ,int clinic_id) async {
    NetworkHelper networkhelper = NetworkHelper(
        url: '$web/comment.php',
        data: {"comment": comment,"user_appid": '$user_id', "clinic_id": '$clinic_id'});
    var userdata = await networkhelper.sendData();
    return userdata;
  }

  Future<dynamic> sendbookingData(String name, String period, int waiting_num,
      int user_id, int clinic_id, int age, int sex) async {
    NetworkHelper networkhelper =
        NetworkHelper(url: '$web/reservation.php', data: {
      "name": name,
      "period": period,
      "waiting_num": '$waiting_num',
      "user_id": '$user_id',
      "clinic_id": '$clinic_id',
      "age": '$age',
      "sex": '$sex',
    });
    var userdata = await networkhelper.sendData();
    return userdata;
  }


  Future<dynamic> getclinics(int specialization) async {
    NetworkHelper networkhelper = NetworkHelper(
      url: '$web/get_clinics.php?specialization=$specialization',
    );
    var clinics = await networkhelper.getData();

    return clinics;
  }


  Future<dynamic> get_await_num(int id) async {
    NetworkHelper networkhelper = NetworkHelper(
      url: '$web/get_await_num.php?clinic_id=$id',
    );
    var clinics = await networkhelper.getData();
    return clinics;
  }
  Future<dynamic> getcomments(int id) async {
    NetworkHelper networkhelper = NetworkHelper(
      url: '$web/getcomment.php?user_id=$id',
    );
    var clinics = await networkhelper.getData();
    return clinics;
  }

  Future<dynamic> getlatlang() async {
    NetworkHelper networkhelper = NetworkHelper(
      url: '$web/getlatlang.php',
    );
    var clinics = await networkhelper.getData();

    return clinics;
  }

  Future<dynamic> getuser(int id) async {
    NetworkHelper networkhelper = NetworkHelper(
      url: '$web/get_user_data.php?id=$id',
    );
    var user = await networkhelper.getData();

    return user;
  }

  Future getdetils(int id) async {
    NetworkHelper networkhelper = NetworkHelper(
      url: '$web/getdetils.php?id=$id',
    );
    var clinics = await networkhelper.getData();
    return clinics;
  }

  Future getfavorit(int user_id) async {
    NetworkHelper networkhelper = NetworkHelper(url: '$web/get_favorit.php?user_id=$user_id');
    var clinics = await networkhelper.getData();
    print(clinics);
    return clinics;
  }
}
