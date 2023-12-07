import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_uygulamasi/main.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {

  var usernameSp;
  var passSp;
  Future<void>Veri_Oku() async {
    var sp= await SharedPreferences.getInstance();

    setState(() {
      usernameSp=sp.getString("username")??"kullanıcı yok";
      passSp=sp.getString("pass")??"parola yok";
    });

  }

  Future<void>LogOut() async{
    var sp= await SharedPreferences.getInstance();

    sp.remove("username");
    sp.remove("pass");

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login_page(),));
  }


  @override
  void initState() {
    super.initState();

    Veri_Oku();

  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
          appBar: AppBar(
        title: Text("Home Page"),
        backgroundColor: Colors.grey[800],
        actions: [
          IconButton(
          onPressed:() {
            LogOut();
          },
              icon: Icon(Icons.exit_to_app,color: Colors.black,size: 40,))
        ],
      ),
      body:
      Center(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Username : "+usernameSp,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
              Text("Parola : "+passSp,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      ),
    );
  }
}
