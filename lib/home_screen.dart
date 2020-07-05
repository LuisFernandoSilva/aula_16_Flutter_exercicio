import 'package:aula_16_flutter_exercicio/card_screen.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  String numberCard = randomNumeric(16).toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Cartão do Nubank Editar Nome'),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(153, 51, 153, .5),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(hintText: 'Nome'),
              validator: (text) {
                if (text.isEmpty) return 'Nome esta vazio';
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: cardNumber(numberCard)),
              enabled: false,
            ),
            SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: RaisedButton.icon(
                    onPressed: () {
                      setState(() {
                        numberCard = randomNumeric(16).toString();
                      });
                    },
                    color: Colors.deepPurple,
                    icon: Icon(Icons.fiber_new),
                    label: Text('Numero'),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  child: RaisedButton(
                    child: Text('Salvar'),
                    onPressed: () {
                      _onSucess();
                      setState(() {
                        numberCard = randomNumeric(16).toString();
                      });
                    },
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String cardNumber(String number) {
    if (numberCard.length <= 16) {
      numberCard.padLeft(16, '0');
      return '${numberCard.substring(0, 4)} ${numberCard.substring(4, 8)} ${numberCard.substring(8, 12)} ${numberCard.substring(12, 16)}';
    }
  }

  void _onSucess() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Usuario Criado com sucesso!"),
      backgroundColor: Theme.of(context).primaryColor,
      duration: Duration(seconds: 3),
    ));
    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  CardScreen(nameController.text, numberCard)));
    });
  }
}
