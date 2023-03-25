import 'package:flutter/material.dart';
import 'package:quizpraktpm/pokemon_data.dart';
import 'pokemon_data.dart';
import 'package:url_launcher/url_launcher.dart';

bool isFav = true;

class DetailedPage extends StatefulWidget {
  final PokemonData pokemon;
  const DetailedPage({Key? key, required this.pokemon}) : super(key: key);

  @override
  State<DetailedPage> createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () { _launchUrl(widget.pokemon.wikiUrl); },
            child: const Icon(Icons.search),
          ),
            appBar: AppBar(
              title: Text('Detail Pokemon'),
              actions: <Widget>[
                IconButton(icon: const Icon(Icons.favorite_border, color:
                Colors.white), onPressed: () {
                  setState(() {
                    isFav = !isFav;
                  });
                  Icon((isFav) ? Icons.favorite : Icons.favorite_border);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Berhasil Tambahkan ke Favorit'),
                    ),
                  );
                },),
              ],
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.pokemon.image.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              child: Image.network(widget.pokemon.image),
                            );
                          },
                          pageSnapping: true,
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        widget.pokemon.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.95,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Type', style: TextStyle(
                                fontWeight: FontWeight.bold)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Text('[' + widget.pokemon.type[1] + ']'),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Weakness', style: TextStyle(
                                fontWeight: FontWeight.bold)
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: Text('[' + widget.pokemon.weakness[1] + ']'),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Previous Evolution', style: TextStyle(
                                fontWeight: FontWeight.bold)
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 15.0),
                            child: Text('[PREVIOUS EVOLUTION]'),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 5.0),
                            child: Text('Next Evolution', style: TextStyle(
                                fontWeight: FontWeight.bold)
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(bottom: 15.0),
                            child: Text('[NEXT EVOLUTION]'),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
            )
        ));
  }

  Future<void> _launchUrl(String url) async {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
