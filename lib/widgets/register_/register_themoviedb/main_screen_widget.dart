
import 'package:flutter/material.dart';
import 'package:flutter_3/widgets/register_/list_movies/list_manga_widget.dart';
import 'package:flutter_3/widgets/register_/list_movies/list_movies_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectTab = 0;
  static final List<Widget> _widgetOptions = <Widget>[

  Text("Hello"),
  // list movies
  MoviesWidget(),
  MangaWidget(),
  
  ];





  void _onTabSelect(int index){
    setState(() {
      _selectTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Мир Аниме", style: TextStyle(
          fontSize: 15,
        ),),
      ),
      body: Center(
        child: _widgetOptions[_selectTab],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectTab,
        backgroundColor: Color.fromRGBO(3, 37, 65, 1),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: "Домой"
          ),
          BottomNavigationBarItem(icon: Icon(Icons.movie),
          label: "Аниме"
          ),
            BottomNavigationBarItem(icon: Icon(Icons.book),
          label: "Манга"
          ),
        ],
        onTap: (index){
          _onTabSelect(index);
        }   
      ),
    );
  }
}


