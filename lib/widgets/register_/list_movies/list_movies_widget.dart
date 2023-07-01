


import 'package:flutter/material.dart';

class Movie {  // класс кторые хранены внутри контейнера
  final String imageName;
  final String title;
  final String time;
  final String description;

  Movie({    //добавление конструктора
    required this.imageName,
    required this.title,
    required this.time,
    required this.description,
  });
}








class MoviesWidget extends StatefulWidget {


   MoviesWidget({super.key});

  @override
  State<MoviesWidget> createState() => _MoviesWidgetState();
}

class _MoviesWidgetState extends State<MoviesWidget> {
  final _movie = [
    Movie(
    imageName: ("assets/images/Frame 1.png"),
    title: "Безумный азарт",
    time: "Количество серий: 24",
    description: "Игрок-профессионал Юмеко Дзябами планирует навести порядок в Частной академии Хяккао — школе, где учеников оценивают исключительно по их умениям играть в азартные игры",
    ),
    Movie(
    imageName: ("assets/images/Frame 2.png"),
    title: "Монстр",
    time: "Количество серий: 74",
    description: "Захватывающий психологический триллер шаг за шагом раскрывает непростую судьбу гениального нейрохирурга Кэндзо Тэммы",
    ),
    Movie(
    imageName: ("assets/images/Frame 3.png"),
    title: "Игра друзей",
    time: "Количество серий: 12",
    description: " Старшеклассник Юити Катагири ценит дружбу превыше всего. Он наслаждается полной жизнью вместе со своими близкими",
    ),
    Movie(
    imageName: ("assets/images/Frame 4.png"),
    title: "Класс превосходства",
    time: "Количество серий: 25",
    description: " Кедо Икусей – знаменитое учебное заведение, в котором обучаются невероятно талантливые ребята",
    ),
    Movie(
    imageName: ("assets/images/Frame 5.png"),
    title: "Блич",
    time: "Количество серий: 366",
    description: "События происходят на территории Японии, где проживает Ичиго Куросаки. Парень с ранних лет отличается от сверстников",
    ),
    Movie(
    imageName: ("assets/images/Frame 6.png"),
    title: "Тетрадь смерти",
    time: "Количество серий: 37",
    description: "Тетрадь смерти — это вещь, с помощью которой боги смерти продлевают себе жизнь. Тетрадь станет частью реального мира, когда коснётся земли",
    ),
    Movie(
    imageName: ("assets/images/Frame 7.png"),
    title: "Сага о Винланде",
    time: "Количество серий: 48",
    description: "За тысячу лет викинги сделали себе имя и репутацию сильнейших племен, жаждущих насилия и мести",
    ),
    Movie(
    imageName: ("assets/images/Frame 8.png"),
    title: "Блю Лок",
    time: "Количество серий: 24",
    description: "Блю Лок — Завышенные амбиции японской футбольной ассоциации привели к принятию авантюрных решений для достижения",
    ),
    Movie(
    imageName: ("assets/images/Frame 9.png"),
    title: "Необъятный океан",
    time: "Количество серий: 12",
    description: "Сюжетная линия решает показать зрителям интересную историю о ярком солнце, теплом пляже, завораживающих пейзажах",
    ),
    Movie(
    imageName: ("assets/images/Frame 10.png"),
    title: "Истребитель демонов",
    time: "Количество серий: 45",
    description: "Тандзиро Камадо — старший сын в семье, потерявший своего отца и взявший на себя заботу о своих родных. Однажды он уходит в соседний город, чтобы продать древесный уголь. Вернувшись утром, парень обнаруживает перед собой страшную картину: вся родня была зверски убита, а единственной выжившей является",
    ),
  ];


  var _filteredMovies = <Movie>[];
  final _searchController = TextEditingController();


  void _searchMovies(){
    final quary = _searchController.text;
    if(quary.isNotEmpty){
      _filteredMovies = _movie.where((Movie movie){
      return movie.title.toLowerCase().contains(quary.toLowerCase());

      }).toList();
    } else {
      _filteredMovies = _movie;
    }
    setState(() {});  
  }

  // логика отслежования 
  
  @override
  void initState(){
    super.initState();
    _filteredMovies = _movie;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(top: 70),
          itemCount: _filteredMovies.length,   
          itemBuilder: (     
            BuildContext context, int index) {
          final movie = _movie[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: 
            Container( 
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color: Colors.black.withOpacity(0.2)),
                      boxShadow: [BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      )]
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: GestureDetector(
                      onTap: (){
                        print("open the film");
                      },
                      child: Row(
                              children: [
                                Image.asset(movie.imageName),
                                SizedBox(width: 15,),
                                 Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(movie.title,
                                       style: const TextStyle(
                                        
                                        fontWeight: FontWeight.bold
                                      ),),
                                      const SizedBox(height: 5,),
                                      Text(movie.time,
                                       style: const TextStyle(
                                        color: Colors.grey,                           
                                      ),),
                                      const SizedBox(height: 20,),
                                      Text(movie.description,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,                   
                                      ),               
                                  ],
                                ),),
                                const SizedBox(width: 15,)
                          ],
                        ),
                    ),          
                  ),
              
                // Material(
                //   color: Colors.transparent,
                //   child: InkWell(
                //     onTap: (){
                //       print("11");
                //     },
                //   ),
                // )
          );
        },
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              label: Text("Поиск"),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20)
              ),          
            ),
          ),
        )
      ],
    );
  }
}


