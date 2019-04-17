import 'package:flutter/material.dart';
import 'custom_text.dart';
import 'package:quizz/models/question.dart';




class PageQuizz extends StatefulWidget {
  @override
  _PageQuizz createState() => new _PageQuizz();

}

class _PageQuizz extends State<PageQuizz> {


  Question question;

  List<Question> listeQuestions = [
    new Question('Aimes tu ce que tu fais maintenant ?', true, '', 'belgique.JPG'),
    new Question('Ce que tu fait est ce trop facile pour toi ? ', false, ' La difficulté aide a progresser', 'lune.jpg'),
    new Question('Te sent tu competent pour cette activité ?', true, '', 'russie.jpg'),
    new Question('Fait tu cette activité a contre coeur ?', false, 'Tout est dans le coeur jeune Padawan', 'nyctalope.jpg'),
    new Question('Cette activité t\'absorbes t\'elle mentalemnt ? ', true, 'Rien de mieux que d\'etre passioné par ce que l\'on fait', 'commodore.jpg'),
    new Question('L\'ambiance autour de toi est elle desagreable ?', false, 'Ecouter de l\'ambiant n\'y changera rien', 'pirate.png'),
    new Question('Les personnes autour de toi sont t\'elles desagreables ?', false, 'Fait leur une grimace', 'tintin.jpg'),
    new Question('Te sent tu heureux ?', true, 'La clé c\'est le bonhneur, c\'est meme le but de cette Application ', 'pharaon.jpg'),
    new Question('Est ce que aujourd\'hui etait mieux que hier ?', true, 'Chaque jour comme le dernier..Parceque je vien de loin !', 'buche.jpg'),
    new Question('Te sent tu progresser', true, 'Progresses mieux que tu ne cours ;) ', 'eagle.jpg')
  ];

  int index = 0;
  int score =0;

  @override
  void initState() {
    super.initState();
    question = listeQuestions[index];

  }

  @override
  Widget build(BuildContext context) {

    double tailleW = MediaQuery.of(context).size.width  ;

    return new Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        backgroundColor: Colors.lightBlueAccent[100],
        title: new CustomText("Le test du bien être"),
      ),
      body: new Container(
        decoration: new BoxDecoration(
            image : new DecorationImage(
                image: new AssetImage("quizz assets/ciel.jpg"),
                fit: BoxFit.cover

            )
        ),
        child : new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[


              new CustomText("Question numero : ${index+1}", factor: 2.1 ),

              new CustomText("Ton score de bien etre est de $score / $index ", factor: 1.5),
              new Card(
                elevation: 10.0,
                child: new Container(
                  height: tailleW * 0.6,
                  width: tailleW *0.6,
                  child: new Image.asset(
                    "quizz assets/${question.imagePath}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new CustomText(question.question, factor: 2.6,),
              new Container(height: 20.0,),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  boutonBool(true),
                  boutonBool(false),
                ],



              )
            ],
          ),
        ),
      ),
    );
  }

RaisedButton boutonBool (bool b) {
    return new RaisedButton(
      elevation: 15.0,
        onPressed:(() => dialogue(b)),
      color: Colors.lightBlueAccent[100],
      child: new CustomText((b)? "Absolument":"Pas du tout", factor: 2.0,),


    );
}
  Future<Null> dialogue (bool b) async {
    bool bonneReponse = (b == question.reponse);
    String vrai ="quizz assets/vrai.jpg";
    String faux = "quizz assets/faux.jpg";
    if (bonneReponse) {
      score++;
    }
    return showDialog(
        context: context,
      barrierDismissible: false,
      builder : (BuildContext context ) {
          return new SimpleDialog(
            title: new CustomText((bonneReponse)? "Tu es en route vers Boudha" : "Sombre dans le materiel capitalistique", factor: 1.2, color: (bonneReponse)?Colors.green : Colors.red,),
            contentPadding: EdgeInsets.all(20.0),
            children: <Widget>[
              new Image.asset((bonneReponse)? vrai : faux, fit: BoxFit.cover,),
              new Container(height:15.0,),
              new CustomText(question.explication, factor: 1.5),
              new Container(height: 20),
              new RaisedButton(onPressed: (){
                Navigator.pop(context);
                questionSuivante();

              },
                child: new CustomText("Question suivante", factor: 1.5, color: Colors.lightBlueAccent,),
              ),
            ],
          );
      }
    );
  }
  Future<Null> alerte() async {
    return showDialog(context: context,
      barrierDismissible: false,
      builder: (BuildContext context2) {
      return new AlertDialog(
        title: new CustomText("Bonheur calculé ! Comme si c'etait aussi facile...", factor: 2.5, color: Colors.blue,),
        contentPadding: EdgeInsets.all(10.0),
        content: new CustomText("Votre Score de Bohneur est de $score / $index", color: Colors.blue,),
        actions: <Widget>[
          new FlatButton(
              onPressed:(() {
                Navigator.pop(context2);
                Navigator.pop(context);
              }) ,
              child: new CustomText("OK", factor: 1.8,))
        ],

      );
      }
    );

  }

  void questionSuivante(){
    if (index < listeQuestions.length) {
      index++;
      setState(() {
        question = listeQuestions[index];
      });
    }
    else{
      alerte();

    }

  }
}


