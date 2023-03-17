import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  String? usernameValue;
  String? passwordValue;
  Color buttonColor= Colors.blue;
  var _isObscured;
  @override
  void initState() {
    // TODO: implement initState
    usernameController=TextEditingController(text: usernameValue);
    passwordController=TextEditingController(text: passwordValue);
    super.initState();
    _isObscured=true;

  }
  @override
  void dispose() {
    // TODO: implement dispose
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (String value) {
                  usernameValue=value;
                },
                controller: usernameController,
                decoration: InputDecoration(
                  labelText:'Username' ,
                  hintText: 'hãy nhập tên đăng nhập của bạn',
                  hintStyle:TextStyle(color: Colors.grey.withOpacity(0.9)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.indigoAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.red),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                onChanged: (String value) {
                  passwordValue=value;
                },
                obscureText: _isObscured,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'hãy nhập password của bạn',
                  hintStyle:TextStyle(color: Colors.grey.withOpacity(0.9)),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.indigoAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: Colors.red),
                  ),

                  suffixIcon: IconButton(
                    padding: const EdgeInsetsDirectional.only(end: 12.0),
                    icon: _isObscured ? const Icon(Icons.visibility): const Icon(Icons.visibility_off),
                    onPressed: (){
                      _isObscured = !_isObscured;
                    },
                  ),
                ),
                // obscureText: true,
                // obscuringCharacter: '*',

              ),
              InkWell(
                onTap: (){
                  //print(usernameController.text);
                  if(buttonColor==Colors.blue){
                    setState(() {
                      buttonColor =Colors.cyanAccent;
                    });
                    setState(() {
                      usernameValue=usernameController.text;
                    });
                    setState(() {
                      passwordValue=passwordController.text;
                    });
                  }else if(buttonColor==Colors.cyanAccent){
                    setState(() {
                      buttonColor==Colors.blue;
                    });
                    setState(() {
                      usernameValue=usernameController.text;
                    });
                    setState(() {
                      passwordValue=passwordController.text;
                    });
                  }

                },

                child: Container(

                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                  margin: EdgeInsets.all(20),
                  color: buttonColor,
                  child: Text(
                    'Button',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Text("Tên đăng nhập và mật khẩu là:"),
              Text("Username: $usernameValue"),
              Text("Password: $passwordValue"),
            ],
          ),
        ),
      ),
    );
  }
}
