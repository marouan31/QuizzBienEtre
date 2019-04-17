import 'package:flutter/material.dart';
import 'package:quizz/widgets/custom_text.dart';
import 'page_quizz.dart';


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    double tailleW = MediaQuery.of(context).size.width  ;

    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Colors.lightBlueAccent[100],
        title: Text(widget.title),
      ),
      body: new Container(
        decoration: new BoxDecoration(
            image : new DecorationImage(
                image: new AssetImage("quizz assets/ciel.jpg"),
              fit: BoxFit.cover

            )
        ),
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            new Card(
              elevation: 40.0,
              child: new Container(
                height: tailleW * 0.7,
                width:  tailleW * 0.7,
                child: new Image.asset('quizz assets/fauteuil.jpg', fit: BoxFit.cover)
              ),
            ),
            new RaisedButton(
              elevation: 40.0,
                color: Colors.lightBlueAccent[100],
                onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute
                      (builder: (BuildContext context){
                        return new PageQuizz();
                    }));

                },
                child: new CustomText(
                    "Tester mon bien être",
                    factor: 2.5,


                )



            ),

          ],
        ),

      ),
      )

    );
  }
}

