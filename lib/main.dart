import 'package:chatapp/screens/LoginScreen.dart';
import 'package:chatapp/screens/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  final preferences = await StreamingSharedPreferences.instance;

  final uid = preferences.getString('UID', defaultValue: 'null');
  final imageUrl = preferences.getString('IMAGE', defaultValue: 'null');
  final name = preferences.getString('NAME', defaultValue: 'null');

  runApp(
    Phoenix(
        child: MaterialApp(
      home: Home(
        uid: uid,
        imageUrl: imageUrl,
        name: name,
      ),
      theme: ThemeData(
          primaryColor: Colors.deepOrangeAccent,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.orange),
      debugShowCheckedModeBanner: false,
    )),
  );
}

class Home extends StatefulWidget {
  final Preference uid, imageUrl, name;

  const Home({Key key, this.uid, this.imageUrl, this.name}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.uid.getValue() == 'null') {
      return LoginPage();
    } else {
      return MainPage(
          uid: widget.uid.getValue(),
          imageUrl: widget.imageUrl.getValue(),
          name: widget.name.getValue());
    }
  }
}
