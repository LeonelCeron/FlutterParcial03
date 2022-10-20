import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DetallePokemon extends StatefulWidget {
  final gameDetalle;
  final Color color;
  final int idgame;

  const DetallePokemon(
      {super.key,
      required this.gameDetalle,
      required this.color,
      required this.idgame});
  @override
  State<DetallePokemon> createState() => _DetallePokemonState();
}

class _DetallePokemonState extends State<DetallePokemon> {
  @override
  Widget build(BuildContext context) {
    var anchodeta = MediaQuery.of(context).size.width;
    var altodeta = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: appBarDetails(),
      backgroundColor: Colors.lightBlueAccent,
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(height: (altodeta >= 700) ? altodeta : altodeta * 1.2),
            Positioned(
              top: 20,
              left: 20,
              child: Text(
                widget.gameDetalle['title'],
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: anchodeta,
                height: altodeta * 0.6,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: anchodeta * 0.3,
                                    child: const Text(
                                      "Nombre :",
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 16),
                                    )),
                                Container(
                                    width: anchodeta * 0.3,
                                    child: Text(
                                      widget.gameDetalle['title'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: anchodeta * 0.3,
                                    child: const Text(
                                      "Genero :",
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 16),
                                    )),
                                Container(
                                    width: anchodeta * 0.3,
                                    child: Text(
                                      widget.gameDetalle['genre'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: anchodeta * 0.3,
                                    child: const Text(
                                      "Plataforma:",
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 16),
                                    )),
                                Container(
                                    width: anchodeta * 0.3,
                                    child: Text(
                                      widget.gameDetalle['platform'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: anchodeta * 0.3,
                                    child: const Text(
                                      "Publicado por :",
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 16),
                                    )),
                                Container(
                                    width: anchodeta * 0.3,
                                    child: Text(
                                      widget.gameDetalle['publisher'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: anchodeta * 0.3,
                                    child: const Text(
                                      "Desarrollador :",
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 16),
                                    )),
                                Container(
                                    width: anchodeta * 0.3,
                                    child: Text(
                                      widget.gameDetalle['developer'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: anchodeta * 0.3,
                                    child: const Text(
                                      "Fecha lanzamiento:",
                                      style: TextStyle(
                                          color: Colors.blueGrey, fontSize: 16),
                                    )),
                                Container(
                                    width: anchodeta * 0.3,
                                    child: Text(
                                      widget.gameDetalle['release_date'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ]),
                        ),
                      ]),
                ),
              ),
            ),
            Positioned(
              top: (altodeta * 0.18) - 10,
              //left: (altodeta / 2) - 220,
              child: CachedNetworkImage(
                  imageUrl: widget.gameDetalle['thumbnail'],
                  height: 150,
                  fit: BoxFit.fitHeight),
            )
          ],
        ),
      ),
    );
  }

  appBarDetails() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
