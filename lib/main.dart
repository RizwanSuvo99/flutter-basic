import 'package:flutter/material.dart';

void main(){
  runApp(const MaterialApp(title:"My-first-App",home: SafeArea(child: MyHomePage(),)));
}

class MyHomePage extends StatelessWidget{
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context){
    return Material(
      child: Column(
        children: [
           MyAppTopBar(
            title: Text(
              "This is Nazim",
              style: Theme.of(context).primaryTextTheme.titleLarge
            )

          )
        ],
      ),
    );
  }
}

class MyAppTopBar extends StatelessWidget{
  const MyAppTopBar({required this.title, super.key});
  final Widget title;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(color: Colors.blue[700]),
      child: Row(
        children: [
          const IconButton(onPressed: null, icon: Icon(Icons.menu),tooltip: "Navigation Menu"),
          Expanded(child: title),
          const IconButton(onPressed: null, icon: Icon(Icons.search),tooltip: "Search"),
        ],
      ),
    );
  }
}
