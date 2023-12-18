
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';


class AuthProvider with ChangeNotifier{

  bool _loading = false;
  bool get Loading =>_loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  void login(String email,String password) async{

    setLoading(true);
    try{
      Response response= await post(Uri.parse('https://reqres.in/api/login'),
        body: {
          'email': email,
          'password': password
        }
      );

      if(response.statusCode==200){
        print('Login SuccessFul');
        setLoading(false);
      }else{
        print('Login UnSuccessFul');
        setLoading(false);
      }

    }catch(e){
      print(e.toString());
      setLoading(false);
    }
  }
}