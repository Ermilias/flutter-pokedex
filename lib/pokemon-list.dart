import 'package:flutter/material.dart';
import 'package:flutter_app/fetcher/getPokemon.dart';
import 'package:flutter_app/models/pokemon.dart';
import 'package:flutter_app/pokemon-details.dart';
import 'package:flutter_app/utils/colors_type.dart';

class PokemonList extends StatefulWidget {
  @override
  _PokemonList createState() => _PokemonList();
}
class _PokemonList extends State<PokemonList> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon List'),
      ),
      body: Container(
        child: FutureBuilder<List<Pokemon>>(
          future: fetchPokemons(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if(snapshot.hasData){
              return GridView.builder(
                  padding: EdgeInsets.all(16.0),
                  itemCount: snapshot.data.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 12.0 / 5.0,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index){
                    return
                      Card(
                        color: colorFromType(snapshot.data[index].types),
                        child: new InkResponse(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PokemonDetails(pokemon: snapshot.data[index]),
                              ),
                            );
                          },
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(3.0),
                              ),
                              ListTile(
                                leading: Image(
                                    image: NetworkImage(snapshot.data[index].imageUrl)
                                ),
                                trailing: Text(
                                    snapshot.data[index].id,
                                    style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 20, fontWeight: FontWeight.bold)
                                )
                              ),
                            ],
                          ),
                        ),
                      );
                  });
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
