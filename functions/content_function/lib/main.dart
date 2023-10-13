import 'dart:async';
import 'dart:convert';

Future<dynamic> main(final context) async {
  final data = context.req.headers;
  final responseType = jsonEncode(data['x-custom-type']);

  switch (responseType) {
    case 'json':
      return context.res.json(
          {'type': 'This is a sample JSON response from Appwrite function'});
    case 'html':
      return context.res.send(
          '<h1>This is a sample HTML response from Appwrite function</h1>',
          200,
          {'content-type': 'text/html'});
    default:
      return context.res
          .send('This is a sample text response from Appwrite function');
  }
}
