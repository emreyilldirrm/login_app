import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shared_preferences_login_uygulamasi/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Future<bool>access_control() async {
    var sp= await SharedPreferences.getInstance();
    String username=sp.getString("username")??"kullacı yok";
    String password=sp.getString("pass")??"Şifre yok";

    if(username=="admin" && password=="123"){
      return true;
    }else{
      return false;
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder<bool>(
        future:access_control(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            bool shouldPassageBeAllowed = snapshot.data!;
            return shouldPassageBeAllowed?Home_Page():Login_page();
          }else{
            return Login_page();
          }
        },
      )
    );
  }
}

class Login_page extends StatefulWidget {

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {

 var tfusername=TextEditingController();
 var tfpass=TextEditingController();


 var scaffoldKey=GlobalKey<ScaffoldState>();

  Future<void>login_procedures() async{
    var username=tfusername.text;
    var pass=tfpass.text;
    if(username == "admin" && pass=="123"){

      var sp= await SharedPreferences.getInstance();
      var user=sp.setString("username", username);
      var password=sp.setString("pass", pass);



      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Home_Page(),));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Giriş Hatalı'),));
    }
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor:Colors.grey[800],
        title: Text("Login Ekranı",style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey[800], // Karanlık arka plan rengi
                        ),
                        child: TextField(
                          controller: tfusername,
                          style: TextStyle(color: Colors.white), // Metin rengi
                          decoration: InputDecoration(
                            hintText: 'Username',
                            hintStyle: TextStyle(color: Colors.grey[400]), // İpucu metni rengi
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.all(16.0),
                          ),
                        ),
                      ),


                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.grey[800], // Karanlık arka plan rengi
                      ),
                      child: TextField(
                        obscureText: true,
                        controller: tfpass,
                        style: TextStyle(color: Colors.white), // Metin rengi
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey[400]), // İpucu metni rengi
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.all(16.0),
                        ),
                      ),
                    ),

                    SizedBox(
                      width: 200,
                      child: TextButton(
                        style: TextButton.styleFrom(

                          backgroundColor: Colors.grey[800], // Karanlık arka plan rengi
                          padding: EdgeInsets.all(10.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                          ),
                        ),
                        onPressed: () {
                          login_procedures();
                          //Navigator.push(context, MaterialPageRoute(builder: (context) => Home_Page(),));
                        },
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white, // Metin rengi
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
      )
    );
  }
}
