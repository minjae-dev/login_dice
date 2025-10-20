import 'package:flutter/material.dart';
import 'package:logindice/dice.dart';
import 'package:logindice/on_bording.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/ ': (context) => OnBoarding(),
        '/login': (context) => LogIn(),
        '/dice': (context) => Dice(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: OnBoarding(),
    );
  }
}

class LogIn extends StatefulWidget {
  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              // focusNode 포커스 받는 특정 위젯 식별
              // FocusScope 어떤 위젯들까지 포커스 받는지 범위 나타냄
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0),
                    child: Center(
                      child: Image(
                        width: 200,
                        height: 200,
                        image: AssetImage(
                          'image/chef.gif',
                        ),
                      ),
                    ),
                  ),
                  Form(
                    child: Theme(
                      data: ThemeData(
                        primaryColor: Colors.teal,
                        inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                            color: Colors.teal,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                      child: Container(
                        child: Padding(
                          padding: const EdgeInsets.all(40.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextFormField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: 'Enter email',
                                ),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              TextFormField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Enter password',
                                ),
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              SizedBox(
                                width: 100.0,
                                height: 50.0,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orangeAccent,
                                  ),
                                  onPressed: () {
                                    if (emailController.text == 'dice' &&
                                        passwordController.text == '1234') {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Dice(),
                                        ),
                                      );
                                    } else if (emailController.text == 'dice' ||
                                        passwordController.text != '1234') {
                                      showSnackBar2(context);
                                    } else if (emailController.text != 'dice' ||
                                        passwordController.text == '1234') {
                                      showSnackBar(context);
                                    } else {
                                      showSnackBar0(context);
                                    }
                                  },
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar0(BuildContext context) {
  final snackBar = SnackBar(
    content: Text(
      '로그인 정보 확인',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.redAccent,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: Text(
      'dice 철자확인',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.redAccent,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showSnackBar2(BuildContext context) {
  final snackBar = SnackBar(
    content: Text(
      '비밀번호 일치 안함',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.redAccent,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
