// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:pildoras_getx_api/providers/strapi_provider.dart';

void main() {
  late StrapiProvider strapiProvider;
  setUp(() async {
    strapiProvider = Get.put(StrapiProvider());
  });
  group('Strapi Provider - llamadas grapql', () {
    test('Test obtenerToken', () async {
      expect(await strapiProvider.obtenerToken(), isNotEmpty);
    });
    test('Test consultarNombreProducto 1', () async {
      expect(
          (await strapiProvider.consultarNombreProducto(1))['producto']
              ['nombre'],
          'producto1');
    });
  });
}
    // Build our app and trigger a frame.
    // await tester.pumpWidget(MyApp());
    // expect(find.text('0'), findsOneWidget);
    // expect(find.text('1'), findsNothing);
    // await tester.tap(find.byIcon(Icons.add));
    // await tester.pump();
    // expect(find.text('0'), findsNothing);
    // expect(find.text('1'), findsOneWidget);
