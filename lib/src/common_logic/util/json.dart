import 'dart:convert';

String jsonFormat(Object? object, {int spaceCount = 2}) {
  final intent = ' ' * spaceCount;
  return JsonEncoder.withIndent(intent).convert(object);
}
