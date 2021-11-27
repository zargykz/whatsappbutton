import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(myApp());
}

void abrirWha({@required numero, @required mensaje}) async {
  String url = "whatsapp://send?phone=$numero&text=$mensaje";

  await canLaunch(url) ? launch(url) : print("No se pudo abrir whatsapp");
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacto Whatsapp',
      home: Screen(),
      theme: ThemeData(
        primaryColor: Color(0XFF1ABC9C),
        accentColor: Color(0XFF030047),
        highlightColor: Color(0XFFB7B7D2),
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Color(0XFF117864),
          ),
          headline2: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Color(0xFFE74C3C),
          ),
        ),
      ),
    );
  }
}

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('img/whaimg.png'),
            Column(
              children: [
                Text("Contactanos Via Whatsapp",
                    style: Theme.of(context).textTheme.headline1),
                Text("Farmacias Economicas",
                    style: Theme.of(context).textTheme.headline2),
              ],
            ),
            MaterialButton(
              onPressed: () {
                abrirWha(
                    numero: "+50371674258",
                    mensaje: "Hola, me interesaria solicitar un producto");
              },
              elevation: 10.0,
              minWidth: 170.0,
              height: 50.0,
              color: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: const Text(
                'Contactar',
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
