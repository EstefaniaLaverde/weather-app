// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import 'data_repository.dart';

// void main() => runApp(TestDataRepo());

// class TestDataRepo extends StatefulWidget {


//   @override
//   _TestDataRepoState createState() => _TestDataRepoState();
// }

// class _TestDataRepoState extends State<TestDataRepo> {
//   DataRepo data = DataRepo();
//   TextEditingController textController1 = TextEditingController();
//   TextEditingController textController2 = TextEditingController();
//   TextEditingController textController3 = TextEditingController();
//   String visualizationText = '';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Column(
//           children: <Widget>[
//             Text(visualizationText),
//             TextField(controller: textController1,),
//             TextButton(onPressed: ()async{
//               await data.getCityWeather(textController1.text);
//               setState(() {
//                 visualizationText = data.citiesNames.toString();
//               });
//             }
//                 , child: Text('search and add!')),

//             TextField(controller: textController2,),
//             TextButton(onPressed: (){
//               data.removeCityWeather(textController2.text);
//               setState(() {
//                 visualizationText = data.citiesNames.toString();
//               });
//             }
//                 , child: Text('delete and unqueue!')),

//             TextField(controller: textController3,),
//             TextButton(onPressed: (){
//               data.updateCityWeather(textController3.text);
//               setState(() {
//                 visualizationText = data.citiesNames.toString();
//               });
//             }
//                 , child: Text('update data!')),

//           ],
//         ),
//       ),
//     );
//   }
// }
