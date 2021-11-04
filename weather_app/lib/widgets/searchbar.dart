import 'package:flutter/material.dart';

void main() => runApp(const AutocompleteExampleApp());

class AutocompleteExampleApp extends StatelessWidget {
  const AutocompleteExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Autocomplete Basic'),
        ),
        body:  Center(
          //child: SearchBar(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

                SizedBox(height: 30,),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                    Icon(Icons.search, size: 40,),
                    SizedBox(width: 10,),
                    Container(child: SearchBar(),width: 400,),
                  ],
                ),


            ],
          )
        ),
      )
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  String _searchText = "";
  List<String> _options = ['Bogotá'];


  @override
  Widget build(BuildContext context) {
    return Autocomplete(optionsBuilder: (TextEditingValue textEditingValue){

        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }

        //en esta parte se debe hacer la query
        return _options;
      },

      onSelected: (String selection){
        print('Seleccionaste: $_options');
      },




    );


  }
}
