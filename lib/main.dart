//import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get_storage/get_storage.dart';
import 'package:pildoras_getx_api/controllers/strapi_controller.dart';
import 'package:pildoras_getx_api/providers/strapi_provider.dart';

// class GlobalController extends GetxController {
//   @override
//   void onInit() {
//     super.onInit();
//   }
// }

// class Asiento {
//   DateTime? fechaHora;
//   double importe;
//   String categoria;
//   String comentario;

//   Asiento(
//       {this.fechaHora,
//       this.importe = 0,
//       this.categoria = "",
//       this.comentario = ""}) {
//     this.fechaHora ??= DateTime.now();
//   }

//   Asiento.fromJson(Map<String, dynamic> json)
//       : fechaHora = DateTime.parse(json['fechaHora']),
//         importe = json['importe'],
//         categoria = json['categoria'],
//         comentario = json['comentario'];

//   Map<String, dynamic> toJson() => {
//         'fechaHora': fechaHora!.toIso8601String(),
//         'importe': importe,
//         'categoria': categoria,
//         'comentario': comentario,
//       };

//   String get indice => fechaHora!.toIso8601String();
// }

void main() async {
  // print("Init");
  // Stopwatch stopwatch = new Stopwatch()..start();
  // await GetStorage.init("asientos");
  // final box = GetStorage("asientos");
  // Iterable<String> t = box.getKeys();
  // print(
  //     "total tiempo carga GetStorage: ${stopwatch.elapsed} longitud ${t.length}");
  // stopwatch = new Stopwatch()..start();
  // t.forEach((e) {
  //   Asiento as = Asiento.fromJson(box.read(e));
  //   if (as.importe < 5)
  //     print(" ind: $e fecha: ${as.fechaHora} importe: ${as.importe}");
  // });
  // print("total tiempo para leer e imprimir: ${stopwatch.elapsed}");

  // var asiento;
  // stopwatch = new Stopwatch()..start();
  // for (var i = 0; i < 10000; i++) {
  //   asiento = Asiento();
  //   asiento.importe = Random().nextInt(100);
  //   box.write(i.toString(), asiento);
  // }
  // print("total tiempo para generar 10000 ${stopwatch.elapsed}");

  // print("---------------------------------------------------------------");

  Get.put(StrapiProvider());
  Get.put(StrapiController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Column(
          children: [
            Center(
                child: StrapiController.to.obx(
              (v) => Text(v),
              onLoading: CircularProgressIndicator(),
              onError: (error) => Text(
                error ?? "",
                style: TextStyle(color: Colors.red),
              ),
            )),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => StrapiController.to.consultarProductos(),
          child: Text("C"),
        ),
      ),
    );
  }
}
