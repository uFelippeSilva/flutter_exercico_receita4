import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Formulário',
      home: MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  bool _switchValue = false;
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu Formulário'),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nome',
              ),
              validator: (value) {
                if (value!.isEmpty == true) {
                  return 'Por favor, digite seu nome.';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
              validator: (value) {
                if (value!.isEmpty == true) {
                  return 'Por favor, digite seu e-mail.';
                }
                return null;
              },
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty == true) {
                  return 'Por favor, digite sua senha.';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            Text('Escolha uma opção:'),
            RadioListTile(
              title: Text('Opção 1'),
              value: 1,
              groupValue: 0,
              onChanged: (int? value) {},
            ),
            RadioListTile(
              title: Text('Opção 2'),
              value: 2,
              groupValue: 0,
              onChanged: (int? value) {},
            ),
            SizedBox(height: 16.0),
            Text('Ativar/Desativar:'),
            Switch(
              value: _switchValue,
              onChanged: (bool value) {
                setState(() {
                  _switchValue = value;
                });
              },
            ),
            SizedBox(height: 16.0),
            Text('Escolha um valor:'),
            Slider(
              value: _sliderValue,
              onChanged: (double value) {
                setState(() {
                  _sliderValue = value;
                });
              },
              min: 0.0,
              max: 100.0,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState != null) {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Formulário em processamento...')),
                    );
                  }
                }
              },
              child: Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
