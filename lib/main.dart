import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Login Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: 'Username'
              ),
            ),
            SizedBox(height: 16,),
            TextField(
              controller: passwordController,
              obscureText: showPassword,
              decoration: InputDecoration(
                hintText: 'Password',
                suffixIcon: InkWell(
                  child: Icon(showPassword ? Icons.visibility :Icons.visibility_off),
                  onTap: (){
                    if(showPassword){
                      setState(() {
                        showPassword = false;
                      });
                    }
                    if(!showPassword){
                      setState(() {
                        showPassword=true;
                      });
                    }
                  },
                )
              ),
            ),

            SizedBox(height: 16,),
            SizedBox(
              width: double.infinity,
              child: TextButton(onPressed: (){
                String username = usernameController.text;
                String password = passwordController.text;
                print('Ini username => $username');
                print('Ini password => $password');
              }, child: Text('Login', style: TextStyle(color: Colors.white),),
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.blue)),),
            )
          ],
        )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
