import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
// exemplo api cep dart http

  var cep = '01234000';
  var endpoint = 'example.api.findcep.com';
  var headers = {'Referer': 'example.com'};
  var request =
      http.Request('GET', Uri.parse("https://${endpoint}/v1/cep/${cep}.json"));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 404) {
    // implementa o fallback para os cep antigos - exemplo 11680000
    var request = http.Request(
        'GET', Uri.parse("https://${endpoint}/v1/cep/removido/${cep}.json"));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
  }

  print(await response.stream.bytesToString());
}
