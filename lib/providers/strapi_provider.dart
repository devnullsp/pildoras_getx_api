import 'package:get/get.dart';

class StrapiProvider extends GetConnect {
  static StrapiProvider get to => Get.find<StrapiProvider>();

  @override
  onInit() async {
    httpClient.baseUrl = "http://localhost:1337";
  }

  Future<String> obtenerToken() async {
    final body = r"""
            mutation {  
              login(input: { identifier: "apitest", password: "testapi" })
              { jwt}}
          """;
    final response = await mutation(body, url: "/graphql");
    final token = "Bearer " + response.body['login']['jwt'];
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Authorization'] = token;
      return request;
    });
    return token;
  }

  Future<dynamic> consultarNombreProducto(int id) async {
    final body = "query {producto(id:$id) {nombre} }";
    final response = await query(body, url: "/graphql");
    return response.body;
  }

  Future<dynamic> consultarNombreProductoRest(int id) async {
    final response = await get("http://localhost:1337/tiendas");
    if (response.statusCode! < 200 || response.statusCode! > 299) {
      throw ("HTTP Error obtenerListaGuilds (${response.statusCode!}) ${response.statusText}");
    }
    //return r.body.map((e) => Guild.fromJson(e)).toList();
    //return Guild.fromJson(r.body);
    print(response.body);
    return response.body;
  }
}
