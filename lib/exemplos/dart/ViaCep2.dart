import 'package:flutter/material.dart';
import 'package:search_cep/search_cep.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Formulario(),
  ));
}

class Formulario extends StatefulWidget {
  @override
  _FormularioState createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  // Controllers que serao nos TextForms para manipulaçao dos dados.
  final _cepController = TextEditingController(); // CEP
  final _enderecoController = TextEditingController(); // Nome da Rua
  final _bairroController = TextEditingController(); // Bairro
  final _cidadeContoller = TextEditingController(); // Cidade / Localidade
  final _ufController = TextEditingController(); //  Unidade federativa Estado.

  @override
  Widget build(BuildContext context) {
    debugDisableShadows = false;
    return Scaffold(
      appBar: AppBar(title: Text("Demo API ViaCep")),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          GestureDetector(
            child: TextFormField(
              controller: _cepController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "CEP"),
              keyboardType: TextInputType.number,
              onChanged: (_cepController) {
                if (_cepController.length >= 8) {
                  _cpe();
                }
              },
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: _enderecoController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Endreço"),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: _bairroController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Bairro"),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: _cidadeContoller,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Cidade"),
          ),
          SizedBox(
            height: 8.0,
          ),
          TextFormField(
            controller: _ufController,
            decoration: InputDecoration(
                border: OutlineInputBorder(), labelText: "Estado"),
          )
        ],
      ),
    );
  }

  // Esta função usa a API ViaCep para preencher o endereço completo no cadastro.
  void _cpe() async {
    // Variáveis que receberão os dados do WebService
    String _bairro;
    String _cidade;
    String _cep;
    String _uf;
    String _endereco;
    final viaCepSearchCep = ViaCepSearchCep();
    _cep = _cepController.text;

    final infoCepJSON = await ViaCepSearchCep.searchInfoByCep(cep: _cep);

    // variáveis recebendo os dados em JSON da API
    _bairro = infoCepJSON.bairro;
    _endereco = infoCepJSON.logradouro;
    _cidade = infoCepJSON.localidade;
    _uf = infoCepJSON.uf;

// controller recebendo os dados das variáveis
    _enderecoController.text = _endereco;
    _bairroController.text = _bairro;
    _cidadeContoller.text = _cidade;
    _ufController.text = _uf;
  }
}
