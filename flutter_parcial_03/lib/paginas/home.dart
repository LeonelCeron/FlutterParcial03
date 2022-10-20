import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cached_network_image/cached_network_image.dart';

import 'detallegame.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List gameApp = [];
  @override
  Widget build(BuildContext context) {
    var ancho = MediaQuery.of(context).size.width;
    var alto = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Stack(
          children: [
            Positioned(
              top: 45,
              left: 20,
              child: Text(
                "GameApp Utec",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Positioned(
              top: 100,
              bottom: 0,
              width: ancho,
              child: Column(children: [
                gameApp.length != null
                    ? Expanded(
                        child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.4),
                        itemCount: gameApp.length,
                        itemBuilder: (context, index) {
                          //var tipo = gameApp[index]['type'][0];

                          return InkWell(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4.0, horizontal: 8),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(20))),
                                  child: Stack(children: [
                                    Positioned(
                                        top: 10,
                                        left: 20,
                                        child: Text(
                                          gameApp[index]['title'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18,
                                              color: Colors.black),
                                        )),
                                    
                                    Positioned(
                                        top: 35,
                                        left: 20,
                                        child: Container(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0,
                                                right: 8.0,
                                                top: 4,
                                                bottom: 4),
                                            child: Text(gameApp[index]['genre'],
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10)),
                                          ),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.amber.shade400),
                                        )),
                                    Positioned(
                                      bottom: 5,
                                      right: 35,
                                      child: CachedNetworkImage(
                                        imageUrl: gameApp[index]['thumbnail'],
                                        height: 80,
                                        fit: BoxFit.fitHeight,
                                      ),
                                    ),
                                  ])),
                            ),
                            
                            onTap: () {
                              //TODO: llamar pantalla
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => DetallePokemon(
                                          pokemonDetalle: gameApp[index],
                                          color: Colors.green,
                                          idpokemon: index)));
                            },
                            
                          );
                        },
                      ))
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ]),
            ),
          ],
        ));
  }

  @override
  void initState() {
    super.initState();
    if (mounted) {
      datosPokemon();
    }
  }

  void datosPokemon() {
   
    var url = Uri.https('raw.githubusercontent.com','/LeonelCeron/FlutterParcial03/main/flutter_parcial_03/freetogame.json');
   
   // var url = Uri.https('www.freetogame.com','/api/games');
    http.get(url).then((value) {
      if (value.statusCode == 200) {
        var decodejsonData = jsonDecode(value.body);
        gameApp = decodejsonData['games'];
        //print(gameApp[2]['id']);
        //print(gameApp);
        setState(() {});
      }

      //  print(decodejsonData);

      
    });
    //200 correcto
    //404 incorrecto
    //500
    //505,504,505
  }
}
